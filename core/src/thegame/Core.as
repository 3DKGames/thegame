package thegame
{
	import flash.display.Sprite;
	import flash.events.Event;
	import thegame.demo.units.DemoGang0;
	import thegame.demo.units.Gangs;
	
	/**
	 * ...
	 * @author David Keys
	 */
	public class Core extends Sprite 
	{
		
		private var _gang_0:Gangs;
		
		public function Core() 
		{
			trace("Test");
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			trace("Test");
			_gang_0 = new DemoGang0();
			addChild(_gang_0);
		}
		
	}
	
}