package com.xes.kupao.model.proxy
{
	import com.xes.kupao.ErrorConst;
	import com.xes.kupao.command.CommandConst;
	import com.xes.kupao.model.vo.PropInfo;
	
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.events.Event;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.net.Responder;
	import flash.utils.Dictionary;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	
	/**
	 * 获取配置文件信息 
	 * @author xiaxien
	 * 
	 */
	public class Proxy_Config extends Proxy
	{
		private var _conn:SQLConnection;
		private var _st:SQLStatement=new SQLStatement();
		
		//从数据库中获取到的配置信息
		private var _aidyLevelInfo:Dictionary=new Dictionary();
		private var _weierLevelInfo:Dictionary=new Dictionary();
		private var _propInfo:Dictionary=new Dictionary();
		private var _heroInfo:Dictionary=new Dictionary;
		private var _goldInfo:Dictionary=new Dictionary;
		private var _specialSkillInfo:Dictionary=new Dictionary;
		private var _commandInfo:Dictionary=new Dictionary;
		private var _errorInfo:Dictionary=new Dictionary();
		
		/**
		 * 请求队列 
		 */
		private var _sqlQueue:Vector.<RequestHandle>;
		
		public static const NAME:String="proxy_config"; 
		public function Proxy_Config(){
			super(NAME);
		}
		override public function onRegister():void{
			
		}
		public function loadConfig():void{
			_sqlQueue=new Vector.<RequestHandle>();
			_sqlQueue.push(new RequestHandle(_aidyLevelInfo,"aidy_level_info",HeroLevelInfo));
			_sqlQueue.push(new RequestHandle(_weierLevelInfo,"weier_level_info",HeroLevelInfo));
			_sqlQueue.push(new RequestHandle(_propInfo,"prop_info",PropInfo));
			_sqlQueue.push(new RequestHandle(_heroInfo,"hero_info",HeroInfo));
			_sqlQueue.push(new RequestHandle(_goldInfo,"gold_info",GoldInfo));
			_sqlQueue.push(new RequestHandle(_specialSkillInfo,"special_skill_info",SpecialSkillInfo));
			_sqlQueue.push(new RequestHandle(_commandInfo,"command_info",CommandInfo));
			//_sqlQueue.push(new RequestHandle(_errorInfo,"error_info",ErrorInfo));
			
			connectDB();
		}
		private function connectDB():void{
			
			var db:File=File.applicationDirectory;
			//assets前面如果有"/"，变成"/assets"就报错
			db=db.resolvePath("assets/db/config.rdb");
			_conn=new SQLConnection();
			_conn.addEventListener(SQLEvent.OPEN,onOpenDB);
			_conn.addEventListener(SQLErrorEvent.ERROR,onErrorDB);
			_st.addEventListener(SQLErrorEvent.ERROR,onErrorST);
			
			_conn.openAsync(db,SQLMode.READ);
		}
		
		protected function onErrorST(event:SQLError):void
		{
			trace(event.details);			
		}
		
		protected function onErrorDB(event:SQLErrorEvent):void
		{
			trace(event.error.message);
		}
		
		protected function onOpenDB(event:SQLEvent):void
		{
			trace("on connect success");
			handleSqlQueue();
		}
		private function handleSqlQueue():void{
			if(_sqlQueue.length<=0){
				sendNotification(CommandConst.INIT);
				return;
			}
			var request:RequestHandle=_sqlQueue.shift();
			var sql:String="SELECT * FROM "+request.sql;
			_st.text=sql;
			_st.sqlConnection=_conn;
			_st.execute(-1,new Responder(request.resultHandle,onErrorST));
			request.addEventListener(Event.COMPLETE,function ():void{
				handleSqlQueue();
			},false,0,true);
		}
		//command info =============
		public function getCommandId(en:String):uint{
			for each (var item:CommandInfo in _commandInfo){
				if(item.en==en){
					return item.id;
				}
			}
			sendNotification(CommandConst.ERROR,ErrorConst.NO_THIS_COMMAND);
			return 0;//0表示没有
		}
		public function getCommandEn(id:uint):String{
			if(_commandInfo[id]){
				return _commandInfo[id].en;
			}
			sendNotification(CommandConst.ERROR,ErrorConst.NO_THIS_COMMAND);
			return "";
		}
		
		//error==========================
		public function getErrorDescribe(id:uint):String{
			if(_errorInfo[id]){
				return _errorInfo[id].describe;
			}
			return "";
		}
		
	}
}
import flash.data.SQLResult;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.utils.Dictionary;

/**
 * 请求数据库 
 * @author xiaxien
 * 
 */
class RequestHandle extends EventDispatcher{
	private var _dic:Dictionary;
	private var _sql:String;
	private var _classDef:Class;
	private var _resultHandle:Function;
	public function RequestHandle(dic:Dictionary,sql:String,classDef:Class,resultHandle:Function=null):void{
		_dic=dic;
		_sql=sql;
		_classDef=classDef;
		_resultHandle=resultHandle;
		
		if(_resultHandle==null){
			_resultHandle=function(result:SQLResult):void{
				var len:uint=result.data.length;
				var vo:Object;
				var resultItem:Object;
				trace("获取信息===================");
				for (var i:int = 0; i < len; i++) 
				{
					vo=new _classDef();
					resultItem=result.data[i];
					for(var item:String in resultItem){
						if(vo.hasOwnProperty(item)){
							vo[item]=resultItem[item];
						}else{
							trace("vo中没有"+item+"该属性。");
						}
					}
					_dic[resultItem.id]=vo;
					trace(vo);
				}
				trace("========================");
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
	}
	public function get sql():String{return _sql;}
	public function get resultHandle():Function{return _resultHandle;}
}
/**
 * 角色每个级别对应的属性增值 
 * @author xiaxien
 * 
 */
class HeroLevelInfo{
	public var id:uint;
	public var level:uint;
	public var magnet:Number;
	public var giant:Number;
	public var sprint:Number;
	public var glide:Number=0;
	/**
	 * 升到下级需要的金币数量 
	 */
	public var upgradeGold:int;
	public function toString():String{
		return "id："+id+" level:"+level+" magnet:"+magnet+" giant:"+giant+" sprint:"+sprint+" upgradeGold:"+upgradeGold+" glide:"+glide;
	}
}
class GoldInfo{
	public var id:uint;
	public var describe:String="";
	public var value:Number=0;
	public function toString():String{
		return "id:"+id+" describe:"+describe+" value:"+value;
	}
}
class SpecialSkillInfo{
	public var id:uint;
	public var describe:String="";
	public function toString():String{
		return "id:"+id+" describe:"+describe;
	}
}
class HeroInfo{
	public var id:uint;
	public var name:String="";
	public var describe:String="";
	public var specialSkill:uint;
	public var magnet:Number;
	public var giant:Number;
	public var sprint:Number;
	public function toString():String{
		return "id："+id+" name:"+name+"describe:"+describe+" magnet:"+magnet+" giant:"+giant+" sprint:"+sprint+" upgradeGold:";
	}
}
class CommandInfo{
	public var id:uint;
	public var describe:String="";
	public var en:String="";
	public var param:String="";
	public function toString():String{
		return "id:"+id+" describe:"+describe+" en:"+en;
	}
}
class ErrorInfo{
	public var id:uint;
	public var describe:String="";
	public var en:String="";
}