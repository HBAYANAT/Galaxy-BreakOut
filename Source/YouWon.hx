package;

import openfl.Assets;
import starling.display.Button;
import starling.textures.Texture;
import starling.display.Image;
import starling.events.Event;
import starling.display.Sprite;

class YouWon extends Sprite {
	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
	}

	function onAddedtoStage(e:Event):Void {
		var bg:Image = new Image(Texture.fromBitmapData(Assets.getBitmapData("assets/bg.png")));
		addChild(bg);
		var btn:Button = new Button(Texture.fromBitmapData(Assets.getBitmapData("assets/Nextlevel.png")));
		btn.alignPivot("center", "center");
		btn.x = stage.stageWidth / 2;
		btn.y = stage.stageHeight / 2;
		addChild(btn);
		btn.addEventListener(Event.TRIGGERED, onStartTrigger);
	}

	function onStartTrigger(e:Event):Void {
		addChild(new BreakOutGame());
	}
}
