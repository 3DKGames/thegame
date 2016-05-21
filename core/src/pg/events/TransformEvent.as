package pg.events
{
	import flash.events.Event;


	public class TransformEvent extends Event
	{

		public static const COMPLETE : String = "te000";
		public static const START : String = "te001";
		public static const IN_COMPLETE : String = "te002";
		public static const OUT_COMPLETE : String = "te003";
		public static const PROGRESS : String = "te004";
		public static const MID : String = "te005";
		
		public var arg:*;

		public function TransformEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, ... a:*) {
			super(type, bubbles, cancelable);
			arg = a;

		}
 // Override clone
		override public function clone():Event{
			return new TransformEvent(type, bubbles, cancelable, arg);
		}
	}
 }