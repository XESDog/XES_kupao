package com.xes.kupao.view.mediator
{
	import com.bit101.components.NumericStepper;
	import com.bit101.components.PushButton;
	import com.bit101.components.Style;
	import com.bit101.components.Text;
	import com.bit101.components.Window;
	import com.xes.kupao.command.CommandConst;
	import com.xes.kupao.model.proxy.Proxy_Config;
	import com.xes.kupao.model.proxy.Proxy_User;
	
	import flash.events.Event;
	import flash.utils.Proxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class MED_Debug extends Mediator
	{
		private var _window:Window;
		private var _idTxt:NumericStepper;
		private var _paramTxt:Text;
		private var _submitBtn:PushButton;
		
		private var _errorTxt:Text;
		
		public static const NAME:String="med_debug";
		public function MED_Debug()
		{
			super(NAME);
			
		}
		override public function onRegister():void{
			Style.fontSize=14;
			_window=new Window(Main.instance,100,100,"调试");
			_window.hasCloseButton=true;
			_window.hasMinimizeButton=true;
			_window.setSize(400,200);
			_idTxt=new NumericStepper(_window);
			_idTxt.minimum=400101;
			_idTxt.maximum=499999;
			_idTxt.step=1;
			_idTxt.setSize(200,20);
			_paramTxt=new Text(_window,0,20,"{这里输入json格式的数据}");
			_paramTxt.setSize(200,120);
			_submitBtn=new PushButton(_window,0,150,"提交",onSubmit);
			
			_errorTxt=new Text(_window,200,0);
			_errorTxt.setSize(200,200);
		}
		override public function handleNotification(notification:INotification):void{
			var name:String=notification.getName();
			var body:Object=notification.getBody();
			var proxyConfig:Proxy_Config=facade.retrieveProxy(Proxy_Config.NAME) as Proxy_Config;
			
			switch(name)
			{
				case CommandConst.ERROR:
				{
					//_errorTxt.text+=proxyConfig.getErrorDescribe(int(body));
					_errorTxt.text+="error"+int(body);
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		override public function listNotificationInterests():Array{
			var arr:Array=[CommandConst.ERROR];
			return arr;
		}
		private function onSubmit(e:Event):void
		{
			sendNotification(String(_idTxt.value),JSON.parse(_paramTxt.text));
			
			var proxyUser:Proxy_User=facade.retrieveProxy(Proxy_User.NAME) as Proxy_User;
			trace(proxyUser);
		}
	}
}