package thegame
{
	import flash.display.Sprite;
	import flash.events.Event;
	import thegame.demo.units.DemoGang0;
	import thegame.demo.units.Gangs;
	import thegame.environment.TheUniverse;
	import thegame.environment.Universe0;
	import org.casalib.util.SingletonUtil;
	import thegame.models.CoreEngine;
	import thegame.events.core.UniversalEvent;
	
	/**
	 * ...
	 * @author David Keys
	 */
	public class Core extends Sprite 
	{
		private var _universe:TheUniverse;
		private var _game_engine:CoreEngine;
		
		private var _gang_0:Gangs;
		
		public function Core() 
		{
			_game_engine = SingletonUtil.singleton(CoreEngine);
			_game_engine.addEventListener(UniversalEvent.TIME_EVENT, onTimerEvent);
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
			_universe = new Universe0();
			addChild(_universe);
			_gang_0 = new DemoGang0();
			addChild(_gang_0);
			_game_engine.startGame();
		}
		private function onTimerEvent($evt:UniversalEvent):void {
			trace(">>>GAME HEARd EVENT");
		}
		
	}
	
}