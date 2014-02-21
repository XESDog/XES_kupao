package com.xes.kupao.model.vo
{
	public class UserVo
	{
		public var id:uint=0;
		public var gold:uint=0;
		/**
		 * 拥有的道具 
		 */
		public var props:Vector.<OwnPropInfo>;
		/**
		 * 拥有的角色 
		 */
		public var heros:Vector.<OwnHeroInfo>;
	}
}
class OwnPropInfo{
	public var id:uint;
	public var count:uint;
}
class OwnHeroInfo{
	public var id:uint;
	public var level:uint;
}