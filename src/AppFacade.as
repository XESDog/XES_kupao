package
{
	import com.xes.kupao.model.proxy.Proxy_Config;
	
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
		}
		override protected function initializeModel():void{
			super.initializeModel();
			registerProxy(new Proxy_Config);
		}
	}
}
class Single{}