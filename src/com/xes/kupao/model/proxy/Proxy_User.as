package com.xes.kupao.model.proxy
{
	import com.xes.kupao.model.vo.UserVo;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * 用户数据处理 
	 * @author xiaxien
	 * 
	 */
	public class Proxy_User extends Proxy
	{
		private var _userVo:UserVo;
		
		public static const NAME:String="proxy_user";
		public function Proxy_User()
		{
			super(NAME);
		}
	}
}