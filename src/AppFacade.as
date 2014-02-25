package
{
	import com.xes.kupao.command.CMD_ChangeState;
	import com.xes.kupao.command.CMD_Init;
	import com.xes.kupao.command.CMD_init;
	import com.xes.kupao.command.CommandConst;
	import com.xes.kupao.model.proxy.AppProxy;
	import com.xes.kupao.model.proxy.AppState;
	import com.xes.kupao.model.proxy.Proxy_Config;
	import com.xes.kupao.model.proxy.Proxy_User;
	import com.xes.kupao.view.mediator.MED_Debug;
	import com.xes.kupao.view.mediator.MED_PhysicsWorld;
	
	import flash.display.DisplayObjectContainer;
	
	import org.puremvc.as3.patterns.facade.Facade;

	public class AppFacade extends Facade
	{
		private static var _instance:AppFacade
		public function AppFacade(single:Single)
		{
		}
		public static function get instance():AppFacade{
			if(_instance==null){
				_instance=new AppFacade(new Single);
			}
			return _instance;
		}
		
		private var _viewContext:DisplayObjectContainer;
		public function setup(viewContext:DisplayObjectContainer):void{
			_viewContext=viewContext;
			
			sendNotification(CommandConst.CHANGE_APP_STATE,AppState.LOADING_STATE);
			
		}
		override protected function initializeModel():void{
			super.initializeModel();
			registerProxy(new AppProxy);
			registerProxy(new Proxy_Config);
			registerProxy(new Proxy_User);
		}
		override protected function initializeController():void{
			super.initializeController();
			registerCommand(CommandConst.CHANGE_APP_STATE,CMD_ChangeState);
			registerCommand(CommandConst.INIT,CMD_init);
		}
		override protected function initializeView():void{
			super.initializeView();
			registerMediator(new MED_Debug);
			registerMediator(new MED_PhysicsWorld);
		}
		public function sendNoti(name:String,body:Object=null,type:String=null):void{
			var proxyConfig:Proxy_Config=retrieveProxy(Proxy_Config.NAME) as Proxy_Config;
			var id:uint=proxyConfig.getCommandId(name);
			sendNotification("cmd"+id,body,type);
		}
		public function regCommand(name:String,commandClassRef:Class):void{
			var proxyConfig:Proxy_Config=retrieveProxy(Proxy_Config.NAME) as Proxy_Config;
			var id:uint=proxyConfig.getCommandId(name);
			registerCommand("cmd"+id,commandClassRef);
		}
	}
}
class Single{}