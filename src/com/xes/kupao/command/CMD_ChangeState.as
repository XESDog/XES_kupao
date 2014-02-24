package com.xes.kupao.command
{
	import com.xes.kupao.model.proxy.AppState;
	import com.xes.kupao.model.proxy.Proxy_Config;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CMD_ChangeState extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			
			var state:Object=notification.getBody();
			switch(state)
			{
				case AppState.LOADING_STATE:
				{
					var proxyConfig:Proxy_Config=facade.retrieveProxy(Proxy_Config.NAME) as Proxy_Config;
					proxyConfig.loadConfig();
					break;
				}
					
				default:
				{
					break;
				}
			}
			
		}
	}
}