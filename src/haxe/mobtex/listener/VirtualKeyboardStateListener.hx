package mobtex.listener;
//#if android
import flash.Lib;

import openfl.utils.JNI;

class VirtualKeyboardStateListener {
    static var savedInstance;

    var callbacks:Array<OnVirtualKeyboardChangeListener>;
    //if virtual keyboard state changes -> sends a signal to all registered callbacks
    private function sendCallBack(state:Bool, diffScreen:Float){
        #if trace
        trace("Callback send at " + Date.now().getTime());
        #end
        for(callback in callbacks){
            if(state){
                callback.onKeyboardUp(diffScreen);
            }else{
                callback.onKeyboardDown(diffScreen);
            }
        }
    }

    //return a saved instance of VirtualKeyboardStateListener
    public static function getInstance():VirtualKeyboardStateListener{
        if(savedInstance == null){
            savedInstance = new VirtualKeyboardStateListener();
        }
        return savedInstance;
    }


    //private to prevent multiple instances
    private function new() {
        callbacks = new Array<OnVirtualKeyboardChangeListener>();
        var jni_enable_listener:Dynamic = JNI.createStaticMethod("mobtex/android/ANVirtualKeyboardListener", "enableListener", "(Lorg/haxe/nme/HaxeObject;)I");
        var returnValue:Int = jni_enable_listener(this);
        if(returnValue == 1){
            #if trace
            trace("Enabled keyboard listener.");
            #end
        }else{
            #if trace
            trace("Wasn't able to set keyboard listener.");
            #end
        }
    }

    public function addCallback(callback:OnVirtualKeyboardChangeListener){
        callbacks.push(callback);
        #if trace
        trace("Current callback stack length: " + callbacks.length);
        #end
    }

    public function removeCallback(callback:OnVirtualKeyboardChangeListener){
        callbacks.remove(callback);
        #if trace
        trace("Current callback stack length: " + callbacks.length);
        #end
    }


    //gets called by JNI when keyboard state changes
    public function onVirtualKeyboardChange(overlayScreenY:Float){
        #if trace
        trace("Listener: virtual keyboard changed " + overlayScreenY);
        #end
        //if screen diff is higher than 1/3 of the screen -> virtual keyboard is up
        sendCallBack(overlayScreenY > Lib.current.stage.stageWidth/0.3, overlayScreenY);
    }
}

interface OnVirtualKeyboardChangeListener {
    function onKeyboardUp(remainingScreenY:Float):Void;
    function onKeyboardDown(remainingScreenY:Float):Void;
}
//#end
