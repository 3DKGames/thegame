package pg.trans {
	
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import pg.events.TransformEvent;
	
	public class TransPosition extends Trans {
		
		private var _tweenX:Tween;
		private var _tweenY:Tween;

		public function TransPosition($obj:Object) {
			_target = $obj;
			ease = "easeNone";
		}
		
		public function transPOS($x:Number, $y:Number):void {
			stop();
			var hastrans:Boolean = false;
			if ($x!=_target.x) {
				_tweenX=new Tween(_target,"x",_type[_ease],_target.x,$x,_speed,true);
				_tweenX.addEventListener(TweenEvent.MOTION_FINISH, onTransEvent);
				//_tweenX.addEventListener(TweenEvent.MOTION_CHANGE, onTransEvent);
				hastrans = true;
			}
			if ($y!=_target.y) {
				_tweenY=new Tween(_target,"y",_type[_ease],_target.y,$y,_speed,true);
				if (hastrans == false) {
					_tweenY.addEventListener(TweenEvent.MOTION_FINISH, onTransEvent);
					//_tweenY.addEventListener(TweenEvent.MOTION_CHANGE, onTransEvent);
				}
			}
		}
		public function get positionX():Number {
			return _tweenX.position;
		}
		public function get positionY():Number {
			return _tweenY.position;
		}

		public function onTransEvent($evt:TweenEvent):void {
			if ($evt.type == TweenEvent.MOTION_FINISH) {
				dispatchEvent(new TransformEvent(TransformEvent.COMPLETE));
			//} else {
				//dispatchEvent(new TransformEvent(TransformEvent.PROGRESS));
			}
		}
		public function stop():void {
			if (_tweenX != null) {
				_tweenX.removeEventListener(TweenEvent.MOTION_FINISH, onTransEvent);
				_tweenX.removeEventListener(TweenEvent.MOTION_CHANGE, onTransEvent);
				_tweenX.stop();
			}
			if (_tweenY != null) {
				_tweenY.removeEventListener(TweenEvent.MOTION_FINISH, onTransEvent);
				_tweenY.removeEventListener(TweenEvent.MOTION_CHANGE, onTransEvent);
				_tweenY.stop();
			}
		}
		public function transToInstant($x:Number,$y:Number):void {
			stop();
			_target.x=$x;
			_target.y=$y;
		}
	}
}