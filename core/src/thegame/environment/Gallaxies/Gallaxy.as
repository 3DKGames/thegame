package thegame.environment.Gallaxies 
{
	import flash.display.MovieClip;
	import org.casalib.util.SingletonUtil;
	import thegame.environment.CoreEnivironment;
	import thegame.environment.displays.gallaxy.DisplayGallaxy;
	import thegame.models.CoreEngine;
	import thegame.events.core.UniversalEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class Gallaxy extends CoreEnivironment
	{
		
		public var display:DisplayGallaxy;
		
		public function Gallaxy() 
		{

		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			displayObject = display;
		}
		override protected function onTimerEvent($evt:UniversalEvent):void {
			trace(">>>GALLAXY HEARd EVENT");
		}
	}

}