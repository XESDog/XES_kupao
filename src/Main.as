package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class Main extends Sprite
	{
		public static var instance:Main;
		public function Main()
		{
			super();
			
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			AppFacade.instance.setup(this);
			
			instance=this;
		}
	}
}