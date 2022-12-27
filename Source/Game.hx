package;

import starling.text.TextField;
import openfl.Assets;
import starling.display.Button;
import starling.textures.Texture;
import starling.display.Image;
import starling.events.Event;
import starling.display.Sprite;

class Game extends Sprite {
	private var t:TextField;
	private var direction = 1;

	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedtoStage);
	}

	function onAddedtoStage(e:Event):Void {
		var bg:Image = new Image(Texture.fromBitmapData(Assets.getBitmapData("assets/bg.png")));
		addChild(bg);
		var btn:Button = new Button(Texture.fromBitmapData(Assets.getBitmapData("assets/btnnobg.png")));
		btn.alignPivot("center", "center");
		btn.x = stage.stageWidth / 2;
		btn.y = stage.stageHeight / 2;
		addChild(btn);
		btn.addEventListener(Event.TRIGGERED, onStartTrigger);
		t = new TextField(stage.stageWidth, 100, "Galaxy BreakOut");
		t.format.color = 0xffffff;
		t.format.size = 45;
		addChild(t);
		t.addEventListener(Event.ENTER_FRAME, txtEnterFrame);
	}

	function onStartTrigger(e:Event):Void {
		addChild(new BreakOutGame());
	}

	function txtEnterFrame(e:Event):Void {
		t.y += direction * 0.5;
		if (t.y + t.height >= 200)
			direction = -1;
		if (t.y <= 0)
			direction = 1;
	}
}
