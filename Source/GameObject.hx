package;

import starling.display.Image;
import starling.textures.Texture;
import starling.display.Sprite;

class GameObject extends Sprite {
	private var img:Image;

	public var xV = 0.0;
	public var yV = 0.0;
	public var MAXxV = 2.0;
	public var MAXyV = 2.0;
	public var xSteps = 3.0;
	public var ySteps = 3.0;

	public function new(tx:Texture) {
		super();
		img = new Image(tx);
		addChild(img);
	}
}
