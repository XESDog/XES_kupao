package com.xes.kupao.model.proxy
{
	import org.puremvc.as3.patterns.proxy.Proxy;
	/**
	 * 应用基础数据处理
	 */
	public class AppProxy extends Proxy
	{
		private var _state:int=0;
		
		public static const NAME:String="appProxy";
		
		public function AppProxy()
		{
			super(NAME);
		}

		/**
		 * 应用状态，默认为0，表示一切都还没开始
		 * 1：loading状态，加载数据中
		 * 2：开始页面状态
		 * 3、游戏中
		 * 4、积分统计
		 */
		public function get state():uint
		{
			return _state;
		}

		/**
		 * @private
		 */
		public function set state(value:uint):void
		{
			_state = value;
		}

	}
}