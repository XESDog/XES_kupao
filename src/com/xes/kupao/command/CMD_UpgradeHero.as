package com.xes.kupao.command
{
	import com.xes.kupao.model.proxy.Proxy_User;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CMD_UpgradeHero extends SimpleCommand
	{
		/*public function CMD_UpgradeHero()
		{
			super();
		}*/
		override public function execute(notification:INotification):void{
			var proxyConfig:Proxy_User=facade.retrieveProxy(Proxy_User.NAME) as Proxy_User;
			
		}
	}
}