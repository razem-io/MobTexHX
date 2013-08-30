package textfield;

import flash.display.StageScaleMode;
import flash.display.StageAlign;
import flash.display.StageQuality;
import flash.Lib;
import textfield.sample.TextFieldSample;
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
