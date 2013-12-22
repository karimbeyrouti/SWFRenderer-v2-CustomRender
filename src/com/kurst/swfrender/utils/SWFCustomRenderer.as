package com.kurst.swfrender.utils
{
	import flash.display.BitmapData;
	import flash.display.Stage;
	/*
	 * SWFCustomRenderer
	 */
	public class SWFCustomRenderer
	{
		
		//-------------------------------------------------------------------------------------------------------------------------------------
		
		private var _stage 		: Stage;
		
		//-------------------------------------------------------------------------------------------------------------------------------------
		
		public function SWFCustomRenderer( stage : Stage )
		{
			_stage = stage;
			init( _stage.stageWidth, _stage.stageHeight );
		}

		//-------------------------------------------------------------------------------------------------------------------------------------
		// Public
		//-------------------------------------------------------------------------------------------------------------------------------------

		/*
		 * getBitmapData()
		 *  
		 * @returns BitmapData used by SWF Renderer to export image sequence 
		 */
		public function getBitmapData() : BitmapData
		{
			return SWFCustomRendererBitmapData.capture;
		}
		
		//-------------------------------------------------------------------------------------------------------------------------------------
		// Private
		//-------------------------------------------------------------------------------------------------------------------------------------
		
		/*
		 * init( width : Number , height : Number )
		 * 
		 * intialise the BitmapData used by SWF Renderer
		 */
		private function init( width : Number , height : Number ) : void
		{
			SWFCustomRendererBitmapData.dispose();
			SWFCustomRendererBitmapData.capture = new BitmapData( width , height );
		}		
		
	}
}
