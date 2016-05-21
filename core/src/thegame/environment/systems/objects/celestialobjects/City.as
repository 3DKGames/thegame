package thegame.environment.systems.objects.celestialobjects 
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import thegame.environment.CoreEnivironment;
	import thegame.environment.displays.city.DisplayCity;
	import flash.events.Event;
	import thegame.units.people.CharSprite;
	/**
	 * ...
	 * @author David Keys
	 */
	public class City extends CoreEnivironment
	{
		public var display:DisplayCity;
		
		protected var _focused_char:CharSprite;
		protected var _last_char:CharSprite;
		
		public function City() 
		{

		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			displayObject = display;
		}
		protected function onCharFocus($evt:MouseEvent):void {
			_focused_char = $evt.target as CharSprite;
			if (_focused_char != _last_char) {
				//tell last char he is not in focus
			}
			_last_char = $evt.target as CharSprite;
		}
		protected function moveChar($x:Number, $y:Number):void {
			_focused_char.x += $x;
			_focused_char.y += $y;
		}
		protected function onKeyEvent($evt:KeyboardEvent):void {
			if ($evt.type == KeyboardEvent.KEY_DOWN) {
				trace($evt.keyCode);
			} else {
				
			}
		}
	}

}