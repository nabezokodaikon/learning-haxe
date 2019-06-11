typedef Point = { x: Int, y: Int };
typedef Point3 = { > Point, z: Int };

class Path {
  var start: { x: Int, y: Int };
}

class Path2 {
  public var start: Point;
  public var target: Point;
  public var current: Point;
  public function new() {}
}

typedef Point2 = {
  var x: Int;
  var y: Int;
}

typedef IterableWithLength<T> = {
  > Iterable<T>,
  var length(default, null): Int;
}

typedef WithLength = {
  var length(default, null): Int;
}

typedef IterableWithLangthAndPush<T> = {
  > Iterable<T>,
  > WithLength,
  function push(a: T): Int;
}

class Main {

  static public function main() {
    {
      var myStructure = { x: 12, name: "foo" };
      trace(myStructure);

      var user = {
        name: "Nicolas",
        age: 32,
        pos: [
          { x: 0, y: 0 },
          { x: 1, y: -1 }
        ],
      };
      trace(user);

      var point = { x: 0.0, y: 12.0 };
      // trace(point.z);

      // var path: Path2 = { start: { x: 10, y: 10 },  target: { x: 10, y: 10 },  current: { x: 10, y: 10 } };
      // path.start.x = 10;
      var path = new Path2();
      path.start = { x: 10, y: 11 };
      trace(path.start);
    }

    {
      var point = { "x": 1, "y": -5 };
      trace(point);
    }

    {
      var p: Point2 = { x: 3, y: 4 };
      trace(p);
    }

    {
      var array = [1, 2, 3];
      trace(array.length);
      var t: IterableWithLength<Int> = array;
      trace(t);
      trace(t.length);
    }

    {
      var array = [1, 2, 3];
      trace(array.length);
      array.push(4);
      var t: IterableWithLangthAndPush<Int> = array;
      t.push(4);
      trace(t);
    }
  }
}
