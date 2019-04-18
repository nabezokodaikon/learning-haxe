class Base {
  public function new() {}
}

class Child1 extends Base {}
class Child2 extends Base {}

class Main {
  static public function main() {
    {
      // var s: String = 1;
    }

    {
      var a = [1, 2, 3];
      var r = empty(a);
      trace('$r');
    }

    {
      var func: Void -> Void = function() return "foo";
      // var r = func();
      var func2: Void -> String = function() return "foo";
      var r = func2();
      trace('$r');
    }

    {
      var a = [new Child1(), new Child2()];
      var t = $type(a);
      trace($type(a));
      trace('$t');
    }
  }

  public static function empty<T>(it: Iterable<T>): Bool {
    return !it.iterator().hasNext();
  }
}
