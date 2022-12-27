package;

import openfl.Assets;
import starling.textures.Texture;

class LevelGenerator {
	public static function GenerateLevel():Array<GameObject> {
		var blocks = new Array<GameObject>();
		for (y in 0...7) {
			for (i in 0...10) {
				var o = new GameObject(Texture.fromBitmapData(Assets.getBitmapData("assets/block.png")));
				o.name = "Brick" + i * y;
				o.x = i * o.width + (i * 5) + 20;
				o.y = y * o.height + (y * 5) + 20;
				blocks.push(o);
			}
		}
		return blocks;
	}

	public static function GenerateLevel2():Array<GameObject> {
		var blocks = new Array<GameObject>();
		var template = [
			[
				0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1,
				0,
				0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0
			],
			[
				1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1,
				0,
				0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0
			]
		];

		for (y in 0...7) { // 7 normally
			for (i in 0...10) { // 10 normaly
				var o = new GameObject(Texture.fromBitmapData(Assets.getBitmapData("assets/block.png")));
				o.name = "Brick" + i * y;
				o.x = i * o.width + (i * 5) + 20;
				o.y = y * o.height + (y * 5) + 20;
				blocks.push(o);
			}
		}

		for (k in 0...70) {
			if (template[0][k] == 0)
				blocks[k].visible = false;
		}
		return blocks;
	}

	public static function LoadTemplates() {}
}
/*
	,
	[
		1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1,
		0,
		0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0
	],
	[
		1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1,
		0,
		0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1
	] */
