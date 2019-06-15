class Base {
  public function new() {}
}

class Child1 extends Base {}
class Child2 extends Base {}

class Main {

  public static function empty<T>(it: Iterable<T>): Bool {
    return !it.iterator().hasNext();
  }

  static public function main() {
    {
      var a = [new Child1(), new Child2()];
      $type(a);
    }
    {
      var func: Void -> String = function() return "foo";
      var a = func();
      trace(a);
    }
    {
      var a = new Array<String>();
      trace(empty(a));
    }
    {
      // var s: String = 1;
    }
  }
}
