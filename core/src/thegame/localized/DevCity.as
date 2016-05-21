package thegame.localized 
{
	import flash.display.MovieClip;
		import org.casalib.util.SingletonUtil;
	import thegame.environment.systems.objects.celestialobjects.City;
	import thegame.environment.systems.objects.celestialobjects.CityMelbourne_child;
	import thegame.models.CoreEngine;
	import thegame.events.core.UniversalEvent;
	/**
	 * ...
	 * @author David Keys
	 */
	public class DevCity extends MovieClip
	{
		private var _game_engine:CoreEngine;
		private var _city_melbourne:City;
		
		public function DevCity() 
		{
			_game_engine = SingletonUtil.singleton(CoreEngine);
			
			if (_game_engine.swcdev) {
				_game_engine.swcdev = false;
				_game_engine.addEventListener(UniversalEvent.TIME_EVENT, onTimerEvent);
				_city_melbourne = new CityMelbourne_child();
				addChild(_city_melbourne);
				_game_engine.startGame();
			}
		}
		private function onTimerEvent($evt:UniversalEvent):void {
			trace(">>>GAME HEARd EVENT");
			if (!_game_engine.runonce) {
				_game_engine.runonce = true;
				_game_engine.focusOn("City Melbourne");
			}
		}
	}

}