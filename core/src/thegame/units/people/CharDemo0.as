package thegame.units.people 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class CharDemo0 extends CharSprite
	{
		
		public function CharDemo0() 
		{
			
		}
		override protected function init(e:Event = null):void 
		{
			super.init();
			//addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame($evt:Event):void {
			frame++;
			if (frame > 24) {
				frame = 1;
			}
			bg.x = -(((frame-1) * 16) + ((frame-1) * 2));
		}
	}

}