package thegame.environment.systems 
{
	import thegame.environment.systems.objects.CelestialObject;
	import thegame.environment.systems.objects.Planet0;
	import thegame.environment.systems.objects.Planet0_child;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author David Keys
	 */
	public class StarSystem0 extends StarSystem
	{
		private var _planet0:CelestialObject;
		
		public function StarSystem0() 
		{
			
		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			_planet0 = new Planet0_child();
			_planet0.x = 200;
			addChild(_planet0);
		}
	}

}