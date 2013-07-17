package textfield;

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
        Lib.current.stage.quality = flash.display.StageQuality.LOW;
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;

        Lib.current.addChild(new TextFieldSample());
	}
}
