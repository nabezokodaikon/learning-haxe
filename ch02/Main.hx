class Point implements Printable {
  var x: Int;
  var y: Int;
  public function new(x, y) {
    this.x = x;
    this.y = y;
  }
  public function toString() {
    return 'Point(${x}, ${y})';
  }
}

class Point3 extends Point {
  var z: Int;
  public function new(x, y, z) {
    super(x, y);
    this.z = z;
  }
}

interface Printable {
  public function toString(): String;
}

interface Placeable {
  public var x: Float;
  public var y: Float;
}

class Main implements Placeable {
  public var x: Float;
  public var y: Float;
  static public function main(): Void {
    trace((new Point(1, 2)).toString());
    var n: Null<Int> = null;
    var a: Int = n;
    trace(a);
  }
}
