package mobtex.ui;
import mobtex.config.MobTexConfig;
import flash.events.KeyboardEvent;
import motion.easing.Elastic;
import motion.Actuate;
import flash.Lib;
import flash.text.TextFormatAlign;
import flash.text.TextFormat;
import flash.events.FocusEvent;
import flash.events.Event;
import flash.text.TextField;

class SoftkeyboardTextField extends TextField{
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

    public function new() {
        super();
        var textFormat:TextFormat = new TextFormat("Arial", 24, 0x6699FF);
        textFormat.align = TextFormatAlign.CENTER;
        textFormat.leading = 2;

        setTextFormat(textFormat);
        //embedFonts = true;
        defaultTextFormat = textFormat;

        addEventListener(KeyboardEvent.KEY_DOWN, onKeyListener);

        addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
        addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);

        if(stage == null){
            addEventListener(Event.ADDED_TO_STAGE, init);
        }else{
            init(null);
        }
    }

    function init(e:Event){
        removeEventListener(Event.ADDED_TO_STAGE, init);
    }

    function onFocusIn(e:FocusEvent){
        trace("Text IN");
        Actuate.tween(Lib.current, configuration.getGlobalEaseDurationIN(), {y : -y}).ease(configuration.getGlobalEaseIN());
        isStageMoved = true;
    }

    function onFocusOut(e:FocusEvent){
        trace("Text OUT");
        Actuate.tween(Lib.current, configuration.getGlobalEaseDurationIN(), {y : 0}).ease(configuration.getGlobalEaseOUT());
        isStageMoved = false;
    }

    function onKeyListener(e:KeyboardEvent){
        if(e.keyCode == 0x999999 && !isStageMoved){
            onFocusIn(null);
        }else if(e.keyCode == 0x666666){
            onFocusOut(null);
        }

    }
}
