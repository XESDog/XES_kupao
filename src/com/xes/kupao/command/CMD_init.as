package com.xes.kupao.command
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class CMD_init extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			AppFacade.instance.regCommand(CommandConst.BUY_GOODS,CMD_BuyProp);
			AppFacade.instance.regCommand(CommandConst.UPGRADE_HERO,CMD_UpgradeHero);
			AppFacade.instance.regCommand(CommandConst.PAGE_CHOOSE_HERO,CMD_PageChooseHero);
			AppFacade.instance.regCommand(CommandConst.CHOOSE_HERO,CMD_ChooseCurrHero);
			AppFacade.instance.regCommand(CommandConst.BUY_HERO,CMD_BuyHero);
			AppFacade.instance.regCommand(CommandConst.OBTAIN_PROP,CMD_ObtainProp);
			AppFacade.instance.regCommand(CommandConst.KILL_ENEMY,CMD_KillEnemy);
			AppFacade.instance.regCommand(CommandConst.APPEND_BUFFER,CMD_AppendBuffer);
			AppFacade.instance.regCommand(CommandConst.HERO_OVER,CMD_HeroOver);
		}
	}
}