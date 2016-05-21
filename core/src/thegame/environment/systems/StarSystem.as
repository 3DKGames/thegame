package thegame.environment.systems 
{
	import thegame.environment.CoreEnivironment;
	import thegame.environment.displays.system.DisplaySystem;
	import thegame.events.core.UniversalEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class StarSystem extends CoreEnivironment
	{
		
		public var display:DisplaySystem;
		
		public function StarSystem() 
		{
			
		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			displayObject = display;
		}
		override protected function onTimerEvent($evt:UniversalEvent):void {
			trace(">>>>>StarSystem Event Herard");
		}
	}

}