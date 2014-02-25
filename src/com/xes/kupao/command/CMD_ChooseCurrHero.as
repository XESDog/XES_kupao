package com.xes.kupao.command
{
	import com.xes.kupao.model.proxy.Proxy_User;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CMD_ChooseCurrHero extends SimpleCommand
	{
		/*public function CMD_ChooseHero()
		{
			super();
		}*/
		override public function execute(notification:INotification):void{
			var proxyUser:Proxy_User=facade.retrieveProxy(Proxy_User.NAME) as Proxy_User;
			proxyUser.chooseCurrHero(int(notification.getBody()));
		}
	}
}