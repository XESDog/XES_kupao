package com.xes.kupao.view.ui
{
	import flash.display.MovieClip;
	
	import citrus.core.starling.StarlingState;
	
	public class ALevel extends StarlingState
	{
		private var _level:MovieClip;
		public function ALevel(level:MovieClip=null)
		{
			super();
			_level=level;
		}
	}
}

