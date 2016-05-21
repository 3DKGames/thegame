package thegame.environment.Gallaxies 
{
	import flash.display.MovieClip;
	import org.casalib.util.SingletonUtil;
	import thegame.environment.CoreEnivironment;
	import thegame.models.CoreEngine;
	import thegame.events.core.UniversalEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class Gallaxy extends CoreEnivironment
	{
		
		
		
		public function Gallaxy() 
		{

		}
		
		override protected function onTimerEvent($evt:UniversalEvent):void {
			trace(">>>GALLAXY HEARd EVENT");
		}
	}

}