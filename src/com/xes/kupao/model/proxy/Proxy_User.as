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
		private var _userVo:UserVo=new UserVo();
		
		public static const NAME:String="proxy_user";
		public function Proxy_User()
		{
			super(NAME);
		}

		/**
		 * 增加金币
		 * @param count
		 * 
		 */
		public function addGold(count:uint):void{
			_userVo.gold+=count;
		}
		public function reduceGold(count:uint):void{
			if(count<=_userVo.gold)
				_userVo.gold-=count;
		}
		/**
		 * 添加道具 
		 * @param id
		 * @param count
		 * 
		 */
		public function addProp(id:uint,count:uint):void{
			_userVo.addProp(id,count);
		}
		public function reduceProp(id:uint,count:uint):void{
			
		}
		/**
		 *  选择当前角色
		 * @param id
		 * 
		 */
		public function chooseCurrHero(id:uint):void{
			if(_userVo.hasHero(id)){	
				_userVo.currHero=id;
			}
		}
		/**
		 * 购买英雄
		 * @param id
		 * 
		 */		
		public function buyHero(id:uint):void{
			if(!_userVo.hasHero(id)){	
				_userVo.currHero=id;
			}
		}
		/**
		 * 
		 * @return 	用户金币
		 * @auther journey
		 */
		public function get gold():uint{
			
			return _userVo.gold;
		}
		
		/**
		 * 升级
		 * @param heroId	角色ID
		 * @auther journey
		 */
		public function upgrade(id:uint):void{
			if(_userVo.hasHero(id)){
				//TODO:级别暂时没有设置上限
				_userVo.upgrade(id);
			}else{
			}
		}
		public function toString():String{
			return _userVo.toString();
		}
		/**
		 *获取英雄信息 
		 * @param ID	角色id
		 * @return 		角色数据 
		 * @auther journey
		 */
		/*public function getHeroInfo(ID:int):HeroVo{
		var tempHero:HeroVo;
		
		return tempHero;
		}*/
	}
}