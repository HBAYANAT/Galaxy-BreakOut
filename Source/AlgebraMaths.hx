package;

import openfl.geom.Point;

class AlgebraMaths {
	public static function DistancePointFromLine(point:Point, LineA:Point, LineB:Point):Float {
		var distance = Math.abs((LineB.x - LineA.x) * (LineA.y - point.y) - (LineA.x - point.x) * (LineB.y - LineA.y)) / Math.sqrt(Math.pow((LineB.x - LineA.x),
			2)
			+ Math.pow((LineB.y - LineA.y), 2));
		return distance;
	}

	public static function DistancePointFromPoint(p1:Point, p2:Point):Float {
		return Point.distance(p1, p2);
	}
}


// comments
