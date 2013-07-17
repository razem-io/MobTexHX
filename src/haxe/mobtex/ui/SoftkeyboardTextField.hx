package mobtex.ui;
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

        //DisplayHandler.getInstance().getTouchSprite().addEventListener(KeyboardEvent.KEY_UP, onKeyPressed);
    }

    function init(e:Event){
        removeEventListener(Event.ADDED_TO_STAGE, init);
    }

    function onFocusIn(e:FocusEvent){
        trace("Text IN");
        Actuate.tween(Lib.current, 0.5, {y : -y}).ease(Elastic.easeOut);
        isStageMoved = true;
    }

    function onFocusOut(e:FocusEvent){
        trace("Text OUT");
        Actuate.tween(Lib.current, 0.5, {y : 0}).ease(Elastic.easeOut);
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
