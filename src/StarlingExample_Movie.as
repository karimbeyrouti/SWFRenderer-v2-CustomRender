package 
{

	import starling.core.Starling;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.AssetManager;

	import starlingdemo.EmbeddedAssets;
	import starlingdemo.Game;

	import com.kurst.swfrender.utils.SWFCustomRenderer;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.Capabilities;
    
    [SWF(width="320", height="480", frameRate="60", backgroundColor="#222222")]
    public class StarlingExample_Movie extends Sprite
    {
		
		//----------------------------------------------------------------------------------------------------
		
        [Embed(source = "../embeds/startup.jpg")]
        private var Background			: Class;
		private var mStarling 			: Starling;
		private var swfCustomRenderer 	: SWFCustomRenderer;
        
		//----------------------------------------------------------------------------------------------------
		
        public function StarlingExample_Movie()
        {
            if (stage) start();
            else addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
        }
        
		//----------------------------------------------------------------------------------------------------
		// Private 
		//----------------------------------------------------------------------------------------------------
		
		/*
		 */
        private function start():void
        {
			initCustomSWFRenderCapture();
            mStarling = new Starling(Game, stage);
            mStarling.enableErrorChecking = Capabilities.isDebugger;
            mStarling.start();
            mStarling.addEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);
			
			//------------------------
			// SWFRenderer : With Stage3D content - the context should be released when the SWF is unloaded
			// 				 Added cleanup handler when UNLOAD event is fired
			//------------------------
			
			loaderInfo.addEventListener(flash.events.Event.UNLOAD, onUnload);
			
			//------------------------
			
		}
		/*
		 */
		private function initCustomSWFRenderCapture() : void
		{
			swfCustomRenderer = new SWFCustomRenderer( stage );
		}
		
		//----------------------------------------------------------------------------------------------------
		// Event Handlers 
		//----------------------------------------------------------------------------------------------------

		/*
		 */
		private function onUnload(event : flash.events.Event ) : void
		{
			mStarling.dispose();
			mStarling = null;
			removeEventListener(flash.events.Event.ENTER_FRAME, onEnterFrame );
			
		}		
		/*
		 */
        private function onAddedToStage(event:Object):void
        {
            removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
            start();
        }
		/*
		 */
        private function onRootCreated(event:starling.events.Event, game:Game):void
        {
            var assets:AssetManager 	= new AssetManager();
	            assets.verbose 			= Capabilities.isDebugger;
    	        assets.enqueue(EmbeddedAssets);
            var bgTexture:Texture 		= Texture.fromEmbeddedAsset(Background, false);
            game.start(bgTexture, assets);
			addEventListener(flash.events.Event.ENTER_FRAME, onEnterFrame );
		}
		/*
		 */
		private function onEnterFrame(event : flash.events.Event) : void
		{
			mStarling.stage.drawToBitmapData( swfCustomRenderer.getBitmapData() );
		}
		
    }
}