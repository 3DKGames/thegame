package thegame.units.people 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class CharSprite extends Sprite
	{
		public var bg:Sprite;
		
		
		protected var frame:int = 1;
		
		public function CharSprite() 
		{
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		protected function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			mouseEnabled = true;
			buttonMode = true;
		}
		public function onFocusIn():void {
			
		}
		public function onFocusOut():void {
			
		}
	}

}