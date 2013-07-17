package textfield.sample;
import flash.text.TextFieldType;
import flash.text.TextFormatAlign;
import flash.text.TextFormat;
import flash.Lib;
import mobtex.ui.SoftkeyboardTextField;
import flash.display.Sprite;
class TextFieldSample extends Sprite{

    public function new() {
        super();



        var textfield:SoftkeyboardTextField = new SoftkeyboardTextField();
        textfield.width = 300;
        textfield.height = 50;
        textfield.x = Lib.current.stage.stageWidth/2 - textfield.width/2;
        textfield.y = Lib.current.stage.stageHeight/2  - textfield.height/2;
        textfield.text = "Click me";
        textfield.background = true;
        textfield.backgroundColor = 0xFFFFFF;
        textfield.selectable = true;
        textfield.type = TextFieldType.INPUT;
        addChild(textfield);
    }
}
