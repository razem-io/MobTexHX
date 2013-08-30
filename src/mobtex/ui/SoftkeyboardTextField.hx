package mobtex.ui;
#if android
import mobtex.listener.VirtualKeyboardStateListener;
#end
import mobtex.config.MobTexConfig;
import motion.Actuate;
import flash.Lib;
import flash.events.FocusEvent;
import flash.text.TextField;

class SoftkeyboardTextField extends TextField #if android implements OnVirtualKeyboardChangeListener #end{
    var _configuration:MobTexConfig;
    public var configuration(get, set):MobTexConfig;

    function set_configuration(value:MobTexConfig):MobTexConfig {
        _configuration = value;
        return value;
    }

    function get_configuration():MobTexConfig {
        return _configuration == null ? MobTexConfig.getGlobal() : _configuration;
    }

    var isStageMoved:Bool = false;
    var isFocused = false;

    public function new() {
        super();

        //only move stage up if mobile on focus in
        #if mobile
        addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
        #end

        //only move stage down if mobile on focus out !besides android which listens for layout change event instead!
        #if (mobile && !android)
        addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
        #end
    }

    function onFocusIn(e:FocusEvent){
        trace("Text IN");
        //if it is on android we need to listen for layout changes instead of moving the stage
        #if android
            VirtualKeyboardStateListener.getInstance().addCallback(this);
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
    public function onKeyboardUp(remainingScreenY:Float):Void{
        trace("Softkeyboard: UP");
        moveStageUp();
    }


    public function onKeyboardDown(remainingScreenY:Float):Void{
        trace("Softkeyboard: DOWN");

        VirtualKeyboardStateListener.getInstance().removeCallback(this);

        moveStageDown();
        stage.focus = null;
    }
    #end

    public function moveStageUp(){
        trace("Moving stage up!");
        if(Lib.current.y == 0){
            Actuate.tween(Lib.current, configuration.getGlobalEaseDurationIN(), {y : -y}).ease(configuration.getGlobalEaseIN());
        }

    }

    public function moveStageDown(){
        trace("Moving stage down!");
        if(Lib.current.y != 0){
            Actuate.tween(Lib.current, configuration.getGlobalEaseDurationIN(), {y : 0}).ease(configuration.getGlobalEaseOUT());
        }
    }
}
