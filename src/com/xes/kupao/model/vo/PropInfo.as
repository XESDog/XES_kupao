package com.xes.kupao.model.vo
{
	/**
	 * 道具描述 
	 * @author xiaxien
	 * 
	 */
	public class PropInfo
	{
		public var id:uint;
		public var name:String;
		/**
		 * 道具描述 
		 */
		public var describe:String;
		/**
		 *需要花费多少钱购买 
		 */
		public var gold:uint;
		
		public function toString():String{
			return "id:"+id+" name:"+name+" describe:"+describe+" gold:"+gold;
		}
	}
}