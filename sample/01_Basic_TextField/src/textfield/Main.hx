package textfield;

import flash.display.*;
import flash.Lib;
import textfield.sample.TextFieldSample;
import mobtex.listener.VirtualKeyboardStateListener;
/**
 * ...
 * @author Julian Liebl
 */

class Main
{
	
	public static function main() 
	{
        Lib.current.stage.quality = StageQuality.LOW;
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;

        Lib.current.addChild(new TextFieldSample());
	}
}
