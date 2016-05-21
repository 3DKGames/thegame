package thegame.environment.systems.objects 
{
	import thegame.environment.displays.planet.DisplayStar;
	/**
	 * ...
	 * @author David Keys
	 */
	public class Star extends CelestialObject
	{
		public var display:DisplayStar;
		
		public function Star() 
		{
			
		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			displayObject = display;
		}
	}

}