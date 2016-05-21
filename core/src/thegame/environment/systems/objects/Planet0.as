package thegame.environment.systems.objects 
{
	import thegame.environment.systems.objects.celestialobjects.City;
	import thegame.environment.systems.objects.celestialobjects.CityMelbourne;
	import thegame.environment.systems.objects.celestialobjects.CityMelbourne_child;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class Planet0 extends Planet
	{
		private var _city_melbourne:City;
		
		public function Planet0() 
		{
			
		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			_city_melbourne = new CityMelbourne_child();
			addChild(_city_melbourne);
		}
	}

}