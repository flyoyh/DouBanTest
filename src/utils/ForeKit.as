package utils
{
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.system.ApplicationDomain;

	public class ForeKit
	{
		public function ForeKit()
		{
		}
		public static function getMovieClicp(id:String,loaderInfo:LoaderInfo=null):MovieClip
		{
			var temMc:MovieClip;
			var mc:Class=getClass(id,loaderInfo);
			temMc=new mc()as MovieClip;
			return temMc;
		}
		public static function getClass(id:String,loaderInfo:LoaderInfo=null):Class
		{
			var temClass:Class;
			if (loaderInfo!=null) 
			{
				temClass=loaderInfo.applicationDomain.getDefinition(id) as Class;
			}
			else
			{
				temClass=ApplicationDomain.currentDomain.getDefinition(id) as Class;
			}
			return temClass;
		}
	}
}