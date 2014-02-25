package com.xes.kupao.view.mediator
{
	import com.xes.kupao.view.ui.MyStarlngCitrusEngine;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * 物理世界视图处理 
	 * @author xiaxien
	 * 
	 */
	public class MED_PhysicsWorld extends Mediator
	{
		private var _starlingCitrusEngine:MyStarlngCitrusEngine;
		
		public static const NAME:String="med_physicsWorld";
		public function MED_PhysicsWorld()
		{
			super(NAME);
		}
		override public function onRegister():void{
			initStarlingCirtusEngine();
		}
		public function initStarlingCirtusEngine():void{
			_starlingCitrusEngine=new MyStarlngCitrusEngine();
			Main.instance.addChild(_starlingCitrusEngine);
		}
	}
}