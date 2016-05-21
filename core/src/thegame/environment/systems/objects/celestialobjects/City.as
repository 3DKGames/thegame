package thegame.environment.systems.objects.celestialobjects 
{
	import thegame.environment.CoreEnivironment;
	import thegame.environment.displays.city.DisplayCity;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class City extends CoreEnivironment
	{
		public var display:DisplayCity;
		
		public function City() 
		{

		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			trace(numChildren);
			trace(display);
			displayObject = display;
		}
	}

}