package thegame.models 
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import thegame.events.core.UniversalEvent;
	/**
	 * ...
	 * @author David Keys
	 */
	public class CoreEngine extends EventDispatcher
	{
		
		private var _game_time:Number;
		
		private var _gameTimer:Timer;
		
		public function CoreEngine() 
		{
			
		}
		public function startGame():void {
			if (_gameTimer == null) {
				_gameTimer = new Timer(1000);
				_gameTimer.addEventListener(TimerEvent.TIMER, onTimerEvent);
				_gameTimer.start();
			}
		}
		public function stopGame():void {
			if (_gameTimer != null) {
				_gameTimer.removeEventListener(TimerEvent.TIMER, onTimerEvent);
				_gameTimer.stop();
			}
		}
		private function onTimerEvent($evt:TimerEvent):void {
			dispatchEvent(new UniversalEvent(UniversalEvent.TIME_EVENT));
		}
		public function focusOn($object:String):void {
			
		}
	}

}