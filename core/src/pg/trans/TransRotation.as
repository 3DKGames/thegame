package pg.trans {
	
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;
	import pg.events.TransformEvent;
	
	public class TransRotation extends Trans {
		
		private var _transRotation:Tween;
		
		public function TransRotation($target:Object) {
			_target = $target;
			ease = "easeNone";
		}
		public function transRotation($trans:Number):void {
			stop();
			_transRotation = new Tween(_target, "rotation", _type[_ease], _target.rotation, $trans, _speed, true);
			_transRotation.addEventListener(TweenEvent.MOTION_FINISH, transDone);
		}
		public function stop():void {
			if (_transRotation != null) {
				_transRotation.removeEventListener(TweenEvent.MOTION_FINISH,transDone);
				_transRotation.stop();
			}
		}
		private function transDone($evt:TweenEvent):void {
			_transRotation.removeEventListener(TweenEvent.MOTION_FINISH,transDone);
			dispatchEvent(new TransformEvent(TransformEvent.COMPLETE))
		}
	}
}