package com.xes.kupao.model.proxy
{
	import com.xes.kupao.model.vo.UserVo;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * 用户数据处理 
	 * @author xiaxien
	 * 
	 */
	public class Proxy_User extends Proxy
	{
		private var _userVo:UserVo;
		
		public static const NAME:String="proxy_user";
		public function Proxy_User()
		{
			super(NAME);
		}
		public function addGold():void{
			
		}
		public function reduceGold():void{
			
		}
		public function addProp():void{
			
		}
		public function reduceProp():void{
			
		}
		public function get gold():uint{
			return _userVo.gold;
		}
		public function upgrade(heroId:uint):void{
			//用户是否有这个hero
			
			//找到对应的hero数据，讲级别升上去
			
		}
	}
}