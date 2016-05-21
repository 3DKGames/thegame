package thegame.environment.systems.objects 
{
	import thegame.environment.displays.planet.DisplayMoon;
	/**
	 * ...
	 * @author David Keys
	 */
	public class Moon extends CelestialObject
	{
		public var display:DisplayMoon
		
		public function Moon() 
		{
			
		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			displayObject = display;
		}
	}

}