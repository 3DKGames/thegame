package thegame.environment 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import org.casalib.util.SingletonUtil;
	import pg.trans.TransAlpha;
	import thegame.environment.displays.Displays;
	import thegame.models.CoreEngine;
	import thegame.events.core.UniversalEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author David Keys
	 */
	public class CoreEnivironment extends MovieClip
	{
		
		protected var _display:DisplayObject;
		
		protected var _game_engine:CoreEngine;
		private var _transA:TransAlpha;
		
		protected var _obj_name:String = 'no name';
		
		public function CoreEnivironment() 
		{
			_game_engine = SingletonUtil.singleton(CoreEngine);
			_game_engine.addEventListener(UniversalEvent.FOCUS_ON_OBJECT, onFocusEvent);
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		protected function set displayObject($display:DisplayObject):void {
			_display = $display;
			_transA = new TransAlpha(_display);
			_display.alpha = 0;
		}
		protected function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		protected function onTimerEvent($evt:UniversalEvent):void {
			
		}
		protected function onFocusEvent($evt:UniversalEvent):void {
			if (_obj_name == $evt.arg) {
				onFocusIn();
			} else {
				onFocusOut();
			}
		}
		public function onFocusIn() {
			_transA.transAlpha(1);
			_game_engine.addEventListener(UniversalEvent.TIME_EVENT, onTimerEvent);
		}
		public function onFocusOut() {
			_transA.transAlpha(0);
			_game_engine.removeEventListener(UniversalEvent.TIME_EVENT, onTimerEvent);
		}
	}

}