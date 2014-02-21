package com.xes.kupao.command
{
	import com.xes.kupao.model.proxy.Proxy_Config;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CMD_LoadConfig extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var proxyConfig:Proxy_Config=facade.retrieveProxy(Proxy_Config.NAME) as Proxy_Config;
			proxyConfig.loadConfig();
		}
	}
}