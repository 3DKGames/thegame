package thegame.environment.systems 
{
	import thegame.environment.CoreEnivironment;
	import thegame.events.core.UniversalEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class StarSystem extends CoreEnivironment
	{
		
		public function StarSystem() 
		{
			
		}
		
		override protected function onTimerEvent($evt:UniversalEvent):void {
			trace(">>>>>StarSystem Event Herard");
		}
	}

}