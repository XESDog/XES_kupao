package
{
	import com.xes.kupao.command.CMD_ChangeState;
	import com.xes.kupao.command.CommandConst;
	import com.xes.kupao.model.proxy.AppProxy;
	import com.xes.kupao.model.proxy.AppState;
	import com.xes.kupao.model.proxy.Proxy_Config;
	import com.xes.kupao.model.proxy.Proxy_User;
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
		}
		override protected function initializeView():void{
			super.initializeView();
			registerMediator(new MED_PhysicsWorld);
		}
		
	}
}
class Single{}