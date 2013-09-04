package mobtex.ui;
#if android
import mobtex.listener.VirtualKeyboardStateListener;
import openfl.utils.JNI;
#end
import flash.geom.Point;
import mobtex.config.MobTexConfig;
import motion.Actuate;
import flash.Lib;
import flash.events.FocusEvent;
import flash.text.TextField;

class SoftkeyboardTextField extends TextField #if android implements OnVirtualKeyboardChangeListener #end{
    var jni_getVisibleDisplayHeight:Dynamic;

    var defaultStageYPos:Float = 0;

    var _isStageMoved:Bool;
    public var isStageMoved(get, null):Bool = false;
    function get_isStageMoved():Bool {
        return _isStageMoved;
    }

    //MobTexConfig for current SoftkeyboardTextField
    var _configuration:MobTexConfig;
    public var configuration(get, set):MobTexConfig;

    function set_configuration(value:MobTexConfig):MobTexConfig {
        _configuration = value;
        return value;
    }

    function get_configuration():MobTexConfig {
        return _configuration == null ? MobTexConfig.getGlobal() : _configuration;
    }

    //If enabled we will get virtual keyboard handling. Otherwise it is a normal TextField.
    var _enabled:Bool;
    public var enabled(get, set):Bool;

    function get_enabled():Bool{
        return _enabled;
    }

    function set_enabled(value:Bool):Bool{
        _enabled = value;
        if(_enabled){
            //only move stage up if mobile on focus in
            #if mobile
            addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
            #end

            //only move stage down if mobile on focus out !besides android which listens for layout change event instead!
            #if (mobile && !android)
            addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
            #end
        }else{
            //only move stage up if mobile on focus in
            #if mobile
            removeEventListener(FocusEvent.FOCUS_IN, onFocusIn);
            #end

            //only move stage down if mobile on focus out !besides android which listens for layout change event instead!
            #if (mobile && !android)
            removeEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
            #end

            #if android
            VirtualKeyboardStateListener.getInstance().removeCallback(this);
            #end
        }
        return _enabled;
    }

    public function new(enabled:Bool = true) {
        super();
        this.enabled = enabled;
        defaultStageYPos = Lib.current.y;
    }

    function onFocusIn(e:FocusEvent){
        trace("Text IN");
        //if it is on android we need to listen for layout changes instead of moving the stage
        #if android
            enableAndroidKeyboardStatePoll();
            //VirtualKeyboardStateListener.getInstance().addCallback(this);
        #else
            moveStageUp();
        #end
    }

    function onFocusOut(e:FocusEvent){
        trace("Text OUT");
        //if it is on android we need to listen for layout changes instead of moving the stage down
        #if !android
            moveStageDown();
        #end
    }

    #if android
    //Workaround for bug: https://haxenme.atlassian.net/browse/NME-252
    function enableAndroidKeyboardStatePoll(){
        if(jni_getVisibleDisplayHeight == null){
            jni_getVisibleDisplayHeight = JNI.createStaticMethod("mobtex/android/ANVirtualKeyboardListener", "getVisibleDisplayHeight", "()I");
        }
        var returnValue:Int = jni_getVisibleDisplayHeight();

        if(!isStageMoved && returnValue != 0){
            onKeyboardUp(returnValue);
        }else if(isStageMoved && returnValue == 0){
            onKeyboardDown(returnValue);
            return;
        }
        Actuate.timer(0.2).onComplete(function(){
            enableAndroidKeyboardStatePoll();
        });
    }

    public function onKeyboardUp(remainingScreenY:Float):Void{
        trace("Softkeyboard: UP");
        moveStageUp();
    }

    public function onKeyboardDown(remainingScreenY:Float):Void{
        trace("Softkeyboard: DOWN");
        //VirtualKeyboardStateListener.getInstance().removeCallback(this);
        moveStageDown();
        stage.focus = null;
    }
    #end

    function moveStageUp(){
        trace("Moving stage up!");
        Actuate.tween(Lib.current, 0.5, {y : - localToGlobal(new Point(x, y)).y + height + configuration.getGlobalPositionOffsetY()}).ease(configuration.getGlobalEaseIN());
        //Actuate.tween(Lib.current, configuration.getGlobalEaseDurationIN(), {y : -y}).ease(configuration.getGlobalEaseIN());
        _isStageMoved = true;
    }

    function moveStageDown(){
        trace("Moving stage down!");
        Actuate.tween(Lib.current, configuration.getGlobalEaseDurationIN(), {y : defaultStageYPos}).ease(configuration.getGlobalEaseOUT());
        _isStageMoved = false;
    }

    public function reset(){
        Actuate.apply(Lib.current, {y : defaultStageYPos});
    }
}
