using StringTools;

class Main {
  static public function main() {
    {
      var point = { x: 10, y: 10 };
      trace(point.x == 10);
    }

    {
      var nums = [ for (i in 0...10) if (i % 2 == 0) i ];
      trace(nums);
    }

    {
      var r = Result.Success([1, 2, 3]);
      var a = switch(r) {
        case Result.Success(a): a;
        case Result.UserError(m): [3, 3, 3];
      }
      trace(a);

    }

    {
      trace(haxe.rtti.Meta.getFields(MyClass).value.range);
    }

    {
      var h = " Me & You ".trim().htmlEscape();
      trace(h);
    }

    {
      var map = new haxe.ds.IntMap();
      var setToTwelve = map.set.bind(_, 12);
      setToTwelve(1);
      trace(map);
      setToTwelve(2);
      trace(map);
    }
  }
}

class MyClass {
  @range(1, 8)
  var value: Int;
}

enum Result {
  Success(data: Array<Int>);
  UserError(msg: String);
}
