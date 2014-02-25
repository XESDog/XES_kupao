package com.xes.kupao.command
{
	import com.xes.kupao.model.proxy.Proxy_User;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class CMD_BuyHero extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var proxyUser:Proxy_User=facade.retrieveProxy(Proxy_User.NAME) as Proxy_User;
			var id:uint = notification.getBody() as uint;
			proxyUser.buyHero(id);
		}
	}
}