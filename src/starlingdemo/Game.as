package starlingdemo
{

	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.utils.AssetManager;

	import starlingdemo.scenes.MovieScene;
	import starlingdemo.utils.ProgressBar;

    public class Game extends Sprite
    {
       
		//------------------------------------------------------------------------------------------------------------

		private var mLoadingProgress:ProgressBar;
		private static var sAssets:AssetManager;

		//------------------------------------------------------------------------------------------------------------
		
		public function Game(){}
		
		//------------------------------------------------------------------------------------------------------------
		// Public
		//------------------------------------------------------------------------------------------------------------
		
		/*
		 */
		public function start(background:Texture, assets:AssetManager):void
		{
		    sAssets = assets;
		    
		    addChild(new Image(background));
		    
		    mLoadingProgress = new ProgressBar(175, 20);
		    mLoadingProgress.x = (background.width  - mLoadingProgress.width) / 2;
		    mLoadingProgress.y = background.height * 0.7;
		    addChild(mLoadingProgress);
		    
		    assets.loadQueue(function(ratio:Number):void
		    {
		        mLoadingProgress.ratio = ratio;
		        
		        if (ratio == 1)
		            Starling.juggler.delayCall(function():void
		            {
		                mLoadingProgress.removeFromParent(true);
		                mLoadingProgress = null;
		                showMovie();
		            }, 0.15);
		    });
		
		}

		//------------------------------------------------------------------------------------------------------------
		// Private
		//------------------------------------------------------------------------------------------------------------
		
		/*
		 */
		private function showMovie():void
		{
			addChild(new MovieScene());
		}

		//------------------------------------------------------------------------------------------------------------
		// Static
		//------------------------------------------------------------------------------------------------------------
		
		/**
		 */
		public static function get assets():AssetManager { return sAssets; }
    }
}