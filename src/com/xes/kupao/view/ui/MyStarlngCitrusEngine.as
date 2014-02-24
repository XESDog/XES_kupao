package com.xes.kupao.view.ui
{
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.utils.LevelManager;
	
	public class MyStarlngCitrusEngine extends StarlingCitrusEngine
	{
		public function MyStarlngCitrusEngine()
		{
			super();
			
			setUpStarling(true);
			gameData=new MyGameData();
			levelManager=new LevelManager(ALevel);
			levelManager.levels=gameData.levels;
			levelManager.onLevelChanged.add(onLevelChanged);
		}
		
		private function onLevelChanged(level:ALevel):void
		{
			state=level;
		}
	}
}

import com.xes.kupao.view.ui.ALevel;

import citrus.utils.AGameData;

class MyGameData extends AGameData{
	private var _levels:Array;
	
	public function MyGameData() {
		
		super();
		
		_levels = [[ALevel, "assets/levels/level1.swf"], [ALevel, "assets/levels/A2/level2.swf"]];
	}
	
	public function get levels():Array {
		return _levels;
	}
	
	override public function destroy():void {
		
		super.destroy();
	}
}