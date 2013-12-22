package com.kurst.swfrender.utils
{
	import flash.display.BitmapData;
	
	/*
	 * @internal - class contains capture bitmapdata used by SWFRenderer application and should not be modified
	 */
	public class SWFCustomRendererBitmapData
	{
		//------------------------------------------------------------------------------------------------

		public static var capture : BitmapData;

		//------------------------------------------------------------------------------------------------
		// Public Static
		//------------------------------------------------------------------------------------------------
				
		/*
		 * dispose() 
		 * 
		 * dispose the bitmapdata object used by custom renderer
		 */
		public static function dispose() : void
		{
			if ( capture )
			{
				capture.dispose();
				capture = null;
			}
		}

	}
}
