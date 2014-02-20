package com.xes.kupao.model.vo
{
	public class UserVo
	{
		public var id:uint=0;
		public var gold:uint=0;
		/**
		 * 拥有的道具 
		 */
		public var props:Vector.<Array>;
		/**
		 * 拥有的角色 
		 */
		public var heros:Vector.<Array>;
	}
}