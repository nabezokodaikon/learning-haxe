class Base {
  public function get_xx() return 1;
}

class Main extends Base {
  public var xx(get, null): Int;
  static var member: String = "bar";

  public var ro(default, null): Int;
  public var wo(null, default): Int;
  public var x(get, set): Int;
  public var y(get, never): Int;

  function get_x() return 1;
  function set_x(x) return x;

  function get_y() return 1;

  function new() {
    var v = x;
    x = 2;
    x += 1;
    trace(x);
  } 

  public var xxx(default, set): Int;
  function set_xxx(newX) {
    return xxx = newX;
  }

  @:isVar
  public var a(get, set): Int;
  function get_a() {
    return a;
  }
  function set_a(a) {
    return this.a = a;
  }

  public static function main() {
    {
      var m = new Main();
      m.x += 1;
      trace(m.x);
    }
    {
      trace(member);
      member = "foo";
      trace(member);
    }
  }
}
