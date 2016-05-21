package pg.anim 
{
	import duga.events.AnimateEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author David Keys
	 */
	public class FrameAnim extends MovieClip
	{
		
		public function FrameAnim() 
		{
			stop();
		}
		override public function play():void {
			addEventListener(Event.ENTER_FRAME, onFrameEvemt);
			super.play();
		}
		private function onFrameEvemt($evt:Event):void {
			if (currentFrame >= totalFrames) {
				removeEventListener(Event.ENTER_FRAME, onFrameEvemt);
				stop();
				dispatchEvent(new AnimateEvent(AnimateEvent.COMPLETE));
			}
		}
		public function reset():void {
			removeEventListener(Event.ENTER_FRAME, onFrameEvemt);
			gotoAndStop(1);
		}
	}

}