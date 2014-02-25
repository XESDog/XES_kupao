package com.xes.kupao.model.vo
{
	

	public class UserVo
	{
		public var id:uint=0;
		public var gold:uint=0;
		/**
		 * 拥有的道具 
		 */
		private var _props:Vector.<OwnPropInfo>;
		/**
		 * 拥有的角色 
		 */
		private var _heros:Vector.<OwnHeroInfo>;
		/**
		 * 当前英雄 
		 */
		public var currHero:uint=100101;
		/**
		 * 是否用户拥有该角色 
		 * @param id
		 * @return 
		 * 
		 */
		public function toString():String{
			return "id:"+id+" gold:"+gold+"currHero:"+currHero+
				"\n[拥有的英雄]\n"+_heros+"\n[拥有的道具]\n"+_props;
		}
		public function hasHero(id:uint):Boolean{
			var len:uint=_heros.length;
			var heroInfo:OwnHeroInfo;
			for (var i:int = 0; i < len; i++) 
			{
				heroInfo=_heros[i];
				if(heroInfo.id==id){
					return true;
				}
			}
			return false;
		}
		public function getHeroInfo(id:uint):OwnHeroInfo{
			var len:uint=_heros.length;
			var heroInfo:OwnHeroInfo;
			for (var i:int = 0; i < len; i++) 
			{
				heroInfo=_heros[i];
				if(heroInfo.id==id){
					return heroInfo;
				}
			}
			return null;
		}
		public function addProp(id:uint,count):void{
			var propInfo:OwnPropInfo=new OwnPropInfo();
			propInfo.id=id;
			propInfo.count=count;
			_props.push(propInfo); 
		}
		public function upgrade(id:uint):void{
			var heroInfo:OwnHeroInfo=getHeroInfo(id);
			heroInfo.level++;
		}
		
		public function buyHero(id:uint):void
		{
			var heroInfo:OwnHeroInfo = new OwnHeroInfo();
			heroInfo.id = id;
			heroInfo.level = 1;
			_heros.push(heroInfo);
		}
	}
}
class OwnPropInfo{
	public var id:uint;
	public var count:uint;
	public function toString():String{
		return "id:"+id+" count:"+count;
	}
}
class OwnHeroInfo{
	public var id:uint;
	public var level:uint;
	public function toString():String{
		return "id:"+id+" level:"+level;
	}
}