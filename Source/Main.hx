package;

import starling.core.Starling;
import openfl.events.Event;
import openfl.display.Sprite;

class Main extends Sprite {
	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	function onAddedToStage(e:Event):Void {
		var star:Starling = new Starling(Game, this.stage);
		star.antiAliasing = 2;
		star.start();
	}

	public static function Main() {
		new Main();
	}
}
