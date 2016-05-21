package thegame.environment 
{
	import flash.display.MovieClip;
	import org.casalib.util.SingletonUtil;
	import thegame.models.CoreEngine;
	import thegame.events.core.UniversalEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author David Keys
	 */
	public class CoreEnivironment extends MovieClip
	{
		protected var _game_engine:CoreEngine;
		
		public function CoreEnivironment() 
		{
			
			_game_engine = SingletonUtil.singleton(CoreEngine);
			_game_engine.addEventListener(UniversalEvent.TIME_EVENT, onTimerEvent);
			
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		protected function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		protected function onTimerEvent($evt:UniversalEvent):void {
			
		}
	}

}