package thegame.environment.systems.objects 
{
	import thegame.environment.displays.planet.DisplayPlanet;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class Planet extends CelestialObject
	{
		
		public var display:DisplayPlanet;
		
		public function Planet() 
		{
			
		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			trace(display);
			displayObject = display;
		}
	}

}