package thegame.environment 
{
	import flash.display.MovieClip;
	import org.casalib.util.SingletonUtil;
	import thegame.environment.Gallaxies.Gallaxy;
	import thegame.environment.Gallaxies.Gallaxy0;
	import thegame.environment.Gallaxies.Gallaxy0_child;
	import thegame.environment.displays.universe.DisplayUninverse;
	import thegame.models.CoreEngine;
	import thegame.events.core.UniversalEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class TheUniverse extends CoreEnivironment
	{
		public var display:DisplayUninverse;
		
		private var _gallaxy0:Gallaxy0;
		
		public function TheUniverse() 
		{

		}
		
		override protected function init(e:Event = null):void 
		{
			super.init();
			_gallaxy0 = new Gallaxy0_child();
			addChild(_gallaxy0);
			displayObject = display;
		}
		override protected function onTimerEvent($evt:UniversalEvent):void {
			trace(">TheUniverse HEARd EVENT");
		}
	}

}