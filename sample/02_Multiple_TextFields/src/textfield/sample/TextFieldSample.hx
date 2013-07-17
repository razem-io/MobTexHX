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

        var screenCenterX = Lib.current.stage.stageWidth/2;
        var screenCenterY = Lib.current.stage.stageHeight/2;

        var textfield1:SoftkeyboardTextField = new SoftkeyboardTextField();
        textfield1.width = 300;
        textfield1.height = 50;
        textfield1.x = screenCenterX - textfield1.width/2;
        textfield1.y = screenCenterY  - textfield1.height/2;
        textfield1.text = "Click me";
        textfield1.background = true;
        textfield1.backgroundColor = 0xFFFFFF;
        textfield1.selectable = true;
        textfield1.type = TextFieldType.INPUT;
        addChild(textfield1);

        var textfield2:SoftkeyboardTextField = new SoftkeyboardTextField();
        textfield2.width = 300;
        textfield2.height = 50;
        textfield2.x = screenCenterX - textfield2.width/2;
        textfield2.y = screenCenterY  - textfield2.height/2 - 100;
        textfield2.text = "Click me";
        textfield2.background = true;
        textfield2.backgroundColor = 0xFFFFFF;
        textfield2.selectable = true;
        textfield2.type = TextFieldType.INPUT;
        addChild(textfield2);
    }
}
