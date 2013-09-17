package mobtex.config;
import flash.display.DisplayObject;
import flash.Lib;
import motion.easing.Expo;
import motion.easing.IEasing;

class MobTexConfig {
    static var globalConfig:MobTexConfig;

    var globalEaseIN:IEasing;
    var globalEaseOUT:IEasing;

    var globalEaseDurationIN:Float = 0.4;
    var globalEaseDurationOUT:Float = 0.4;

    var globalPositionOffsetY:Float = 100;
    var globalPositionOffsetX:Float = 0;

    var globalScaleY:Float = 1;
    var globalScaleX:Float = 1;

    var globalDisplayObject:DisplayObject;

    public function new(){

    }

    //////****** GETTERS ******//////

    public static function getGlobal():MobTexConfig{
        if(globalConfig == null) globalConfig = new MobTexConfig();
        return globalConfig;
    }


    /**
	 * Gets the easing which is used to center an element on virtual keyboard fly in
	 * @return an Actuate easing equation, like Elastic.easeIn or Quad.easeOut
	 */
    public function getGlobalEaseIN():IEasing {
        if(globalEaseIN == null) globalEaseIN = Expo.easeOut;
        return globalEaseIN;
    }

    /**
	 * Gets the easing which is used to center an element on virtual keyboard fly out
	 * @return an Actuate easing equation, like Elastic.easeIn or Quad.easeOut
	 */
    public function getGlobalEaseOUT():IEasing {
        if(globalEaseOUT == null) globalEaseOUT = Expo.easeOut;
        return globalEaseOUT;
    }

    /**
	 * Gets the duration which is used for the animation to center an element on virtual keyboard fly in
	 * @return duration of the animation in seconds
	 */
    public function getGlobalEaseDurationIN():Float {
        return globalEaseDurationIN;
    }

    /**
	 * Gets the duration which is used for the animation to center an element on virtual keyboard fly out
	 * @return duration of the animation in seconds
	 */
    public function getGlobalEaseDurationOUT():Float {
        return globalEaseDurationOUT;
    }

    /**
	 * Gets the y offset. If a positive offset is set the stage gets moved minus the offset.
	 * @return offset x
	 */
    public function getGlobalPositionOffsetX():Float {
        return globalPositionOffsetX;
    }

    /**
	 * Gets the x offset. If a positive offset is set the stage gets moved minus the offset.
	 * @return offset y
	 */
    public function getGlobalPositionOffsetY():Float {
        return globalPositionOffsetY;
    }

    /**
	 * Gets the x scale which will be used for localToGlobal functions.
	 * @return scale x
	 */
    public function getGlobalScaleX():Float {
        return globalScaleX;
    }

    /**
	 * Gets the y scale which will be used for localToGlobal functions.
	 * @return scale y
	 */
    public function getGlobalScaleY():Float {
        return globalScaleY;
    }

    /**
	 * Sets the display object which will be moved when a text field gets focused.
	 * @param	displayObject the display object
	 * @return MobTexConfig
	 */
    public function getGlobalDisplayObject():DisplayObject {
        if(globalDisplayObject == null) return Lib.current;
        return globalDisplayObject;
    }

    //////****** SETTERS ******//////

    /**
	 * Sets the easing which is used to center an element on virtual keyboard fly in and out
	 * @param	easing An Actuate easing equation, like Elastic.easeIn or Quad.easeOut
	 * @return MobTexConfig
	 */
    public function setGlobalEase(easing:IEasing):MobTexConfig {
        globalEaseIN = easing;
        globalEaseOUT = easing;
        return this;
    }

    /**
	 * Sets the easing which is used to center an element on virtual keyboard fly in
	 * @param	easing An Actuate easing equation, like Elastic.easeIn or Quad.easeOut
	 * @return MobTexConfig
	 */
    public function setGlobalEaseIN(easing:IEasing):MobTexConfig {
        globalEaseIN = easing;
        return this;
    }

    /**
	 * Sets the easing which is used to center an element on virtual keyboard fly out
	 * @param	easing An Actuate easing equation, like Elastic.easeIn or Quad.easeOut
	 * @return MobTexConfig
	 */
    public function setGlobalEaseOUT(easing:IEasing):MobTexConfig {
        globalEaseOUT = easing;
        return this;
    }

    /**
	 * Sets the duration of the easing which is used to center an element on virtual keyboard fly in and out
	 * @param	easingDuration duration of easing in seconds
	 * @return MobTexConfig
	 */
    public function setGlobalEaseDuration(easingDuration:Float):MobTexConfig {
        globalEaseDurationIN = easingDuration;
        globalEaseDurationOUT = easingDuration;
        return this;
    }

    /**
	 * Sets the duration of the easing which is used to center an element on virtual keyboard fly in
	 * @param	easingDuration duration of easing in seconds
	 * @return MobTexConfig
	 */
    public function setGlobalEaseDurationIN(easingDuration:Float):MobTexConfig {
        globalEaseDurationIN = easingDuration;
        return this;
    }

    /**
	 * Sets the duration of the easing which is used to center an element on virtual keyboard fly out
	 * @param	easingDuration duration of easing in seconds
	 * @return MobTexConfig
	 */
    public function setGlobalEaseDurationOUT(easingDuration:Float):MobTexConfig {
        globalEaseDurationOUT = easingDuration;
        return this;
    }

    /**
	 * Sets the y offset. If a positive offset is set the stage gets moved minus the offset.
	 * @param	positionOffsetY offset y
	 * @return MobTexConfig
	 */
    public function setGlobalPositionOffsetY(positionOffsetY:Float):MobTexConfig {
        globalPositionOffsetY = positionOffsetY;
        return this;
    }

    /**
	 * Sets the x offset. If a positive offset is set the stage gets moved minus the offset.
	 * @param	positionOffsetX offset x
	 * @return MobTexConfig
	 */
    public function setGlobalPositionOffsetX(positionOffsetX:Float):MobTexConfig {
        globalPositionOffsetX = positionOffsetX;
        return this;
    }

    /**
	 * Sets the y scale. It will used for localToGlobal functions.
	 * @param	scaleYValue scale y
	 * @return MobTexConfig
	 */
    public function setGlobalScaleY(scaleYValue:Float):MobTexConfig {
        globalScaleY = scaleYValue;
        return this;
    }

    /**
	 * Sets the x scale. It will used for localToGlobal functions.
	 * @param	scaleXValue scale x
	 * @return MobTexConfig
	 */
    public function setGlobalScaleX(scaleXValue:Float):MobTexConfig {
        globalScaleX = scaleXValue;
        return this;
    }

    /**
	 * Sets the display object which will be moved when a text field gets focused.
	 * @param	displayObject the display object
	 * @return MobTexConfig
	 */
    public function setGlobalDisplayObject(displayObject:DisplayObject):MobTexConfig {
        globalDisplayObject = displayObject;
        return this;
    }

}
