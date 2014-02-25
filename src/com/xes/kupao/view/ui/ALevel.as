package com.xes.kupao.view.ui
{
	import flash.display.MovieClip;
	
	import citrus.core.starling.StarlingState;
	import citrus.physics.box2d.Box2D;
	
	public class ALevel extends StarlingState
	{
		private var _level:MovieClip;
		public function ALevel(level:MovieClip=null)
		{
			super();
			_level=level;
		}
		override public function initialize():void{
			super.initialize();
			var box2d:Box2D=new Box2D("box2D");
			add(box2d);
			box2d.visible=true;
		}
	}
}

