package;

import openfl.Assets;
import starling.display.BlendMode;
import openfl.geom.Point;
import starling.core.Starling;
import starling.display.Image;
import starling.textures.Texture;
import starling.events.Event;
import starling.display.Sprite;

class BreakOutGame extends Sprite {
	// variable declaration for my game
	private var paddle:GameObject;
	private var ball:GameObject;
	private var Playing:Bool = false;
	private var blocks:Array<GameObject>;
	private var gameScore:Int = 0;
	private var cVortex:Image;

	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, initGame);
	}

	function initGame(e:Event):Void {
		// init game assets and objects

		var bg:Image = new Image(Texture.fromBitmapData(Assets.getBitmapData("assets/bg.png")));
		addChild(bg);
		cVortex = new Image(Texture.fromBitmapData(Assets.getBitmapData("assets/vortex.png")));
		cVortex.alignPivot("center", "center");
		cVortex.y = stage.stageHeight / 2;
		cVortex.x = stage.stageWidth / 2;
		addChild(cVortex);
		cVortex.blendMode = BlendMode.SCREEN;
		cVortex.alpha = 0.45;

		paddle = new GameObject(Texture.fromBitmapData(Assets.getBitmapData("assets/paddle.png")));
		paddle.alignPivot();
		paddle.scaleX = 0.6;
		paddle.scaleY = 0.5;
		paddle.y = stage.stageHeight - 75;
		paddle.x = stage.stageWidth / 2;

		ball = new GameObject(Texture.fromBitmapData(Assets.getBitmapData("assets/wball.png")));
		ball.alignPivot();
		ball.x = stage.stageWidth / 2;
		ball.y = stage.stageHeight - 100;
		ball.xV = 1;
		ball.yV = -1;

		blocks = LevelGenerator.GenerateLevel2();
		for (o in blocks)
			addChild(o);

		addChild(paddle);
		addChild(ball);

		// add Event EnterFrame to start game loop
		addEventListener(Event.ENTER_FRAME, gameLoop);
	}

	function gameLoop() {
		checkGameWon();
		checkGameOver();

		cVortex.rotation += 0.01;

		paddle.x += ((Starling.current.nativeStage.mouseX - paddle.x) * 0.2);
		ball.x += ball.xV * ball.xSteps;
		ball.y += ball.yV * ball.ySteps;

		paddleBoundaries();
		ballBoundaries();
		ballToPaddle();
		ballToBlocks();
	}

	function checkGameWon() {
		var tempScore = 0;
		for (block in blocks) {
			if (block.visible == false) {
				tempScore++;
			}
		}
		gameScore = tempScore;
		if (gameScore == blocks.length) {
			trace("You Won The Game");
			this.dispose();
			stage.addChild(new YouWon());
			removeChild(this);
		}
	}

	function checkGameOver() {
		if (ball.y >= stage.stageHeight - ball.height) {
			trace("You Lose");
			this.dispose();
			stage.addChild(new GameOver());
			removeChild(this);
		}
	}

	function ballToBlocks():Void {
		//
		//   A----B
		//   D----C
		//

		for (block in blocks) {
			if (block.visible)
				if (((ball.x + ball.width / 2 >= block.x) && (ball.x - ball.width / 2 <= block.x + block.width))
					&& ((ball.y + ball.height / 2 >= block.y) && (ball.y - ball.height / 2 <= block.y + block.height))) {
					if (ball.yV >= 0) { // ball going DOWN
						if (ball.xV >= 0) {
							var dist = AlgebraMaths.DistancePointFromLine(new Point(ball.x, ball.y), new Point(block.bounds.left, block.bounds.top),
								new Point(block.bounds.right, block.bounds.top));
							var dist2 = AlgebraMaths.DistancePointFromLine(new Point(ball.x, ball.y), new Point(block.bounds.left, block.bounds.top),
								new Point(block.bounds.left, block.bounds.bottom));

							if (dist < dist2) {
								ball.yV = Math.abs(ball.yV) * -1;
							} else if (dist > dist2) {
								ball.xV = Math.abs(ball.xV) * -1;
							} else if (dist == dist2) {
								ball.yV = Math.abs(ball.yV) * -1;
								ball.xV = Math.abs(ball.xV) * -1;
							}
						} else if (ball.xV <= 0) {
							var dist = AlgebraMaths.DistancePointFromLine(new Point(ball.x, ball.y), new Point(block.bounds.left, block.bounds.top),
								new Point(block.bounds.right, block.bounds.top));
							var dist2 = AlgebraMaths.DistancePointFromLine(new Point(ball.x, ball.y), new Point(block.bounds.right, block.bounds.top),
								new Point(block.bounds.right, block.bounds.bottom));
							if (dist < dist2) {
								ball.yV = Math.abs(ball.yV) * -1;
							} else if (dist > dist2) {
								ball.xV = Math.abs(ball.xV);
							} else if (dist == dist2) {
								ball.yV = Math.abs(ball.yV) * -1;
								ball.xV = Math.abs(ball.xV);
							}
						}
					} else if (ball.yV <= 0) { // ball going UP
						if (ball.xV >= 0) {
							var dist = AlgebraMaths.DistancePointFromLine(new Point(ball.x, ball.y), new Point(block.bounds.left, block.bounds.bottom),
								new Point(block.bounds.right, block.bounds.bottom));
							var dist2 = AlgebraMaths.DistancePointFromLine(new Point(ball.x, ball.y), new Point(block.bounds.left, block.bounds.top),
								new Point(block.bounds.left, block.bounds.bottom));

							if (dist < dist2) {
								ball.yV = Math.abs(ball.yV);
							} else if (dist > dist2) {
								ball.xV = Math.abs(ball.xV) * -1;
							} else if (dist == dist2) {
								ball.yV = Math.abs(ball.yV);
								ball.xV = Math.abs(ball.xV) * -1;
							}
						} else if (ball.xV <= 0) {
							var dist = AlgebraMaths.DistancePointFromLine(new Point(ball.x, ball.y), new Point(block.bounds.left, block.bounds.bottom),
								new Point(block.bounds.right, block.bounds.bottom));
							var dist2 = AlgebraMaths.DistancePointFromLine(new Point(ball.x, ball.y), new Point(block.bounds.right, block.bounds.top),
								new Point(block.bounds.right, block.bounds.bottom));

							if (dist < dist2) {
								ball.yV = Math.abs(ball.yV);
							} else if (dist > dist2) {
								ball.xV = Math.abs(ball.xV);
							} else if (dist == dist2) {
								ball.yV = Math.abs(ball.yV);
								ball.xV = Math.abs(ball.xV);
							}
						}
					}
					removeChild(block);
					block.visible = false;
					block.dispose();
					gameScore++;
				}
		}
	}

	function paddleBoundaries():Void {
		if (paddle.x + paddle.width / 2 > stage.stageWidth)
			paddle.x = stage.stageWidth - (paddle.width / 2);
		if (paddle.x - paddle.width / 2 < 0)
			paddle.x = paddle.width / 2;
	}

	function ballBoundaries():Void {
		// X Axis  left and right boundaries
		if (ball.x + ball.width / 2 > stage.stageWidth) {
			ball.x = stage.stageWidth - (ball.width / 2);
			ball.xV *= -1;
		}
		if (ball.x - ball.width / 2 < 0) {
			ball.x = ball.width / 2;
			ball.xV *= -1;
		}
		// Y Axis  Top and Botom boundaries
		if (ball.y + ball.height / 2 > stage.stageHeight) {
			// ball.y = stage.stageHeight - (ball.width / 2);
			// ball.yV *= -1;
		}
		if (ball.y - ball.width / 2 < 0) {
			ball.y = ball.width / 2;
			ball.yV *= -1;
		}
	}

	function ballToPaddle():Void {
		if ((ball.y + (ball.height / 2) >= paddle.y - (paddle.height / 2))
			&& ((ball.x >= paddle.x - paddle.width / 2) && (ball.x <= paddle.x + paddle.width / 2))) {
			ball.y = (paddle.y - paddle.height / 2) - (ball.width / 2);
			ball.yV *= -1;
			ball.xV -= (paddle.x - ball.x) * 0.01;
			if (ball.xV > ball.MAXxV)
				ball.xV = ball.MAXxV;
			if (ball.yV > ball.MAXyV)
				ball.yV = ball.MAXyV;
		}
	}
}
