class Base {
  public function get_x() return 1;
}

class Main extends Base {
  public var x(get, null): Int;

  public var y(default, set): Int;

  public var z(null, set): Int;

  function set_y(newY) {
    return y = newY;
  }

  function set_z(newZ) {
    return z = newZ;
  }

  @:isVar public var a(get, set): Int;
  function get_a() {
    return a;
  }
  function set_a(a) {
    return this.a = a;
  }

  public function new() {}

  static public function main() {
    var m = new Main();
    m.y = 3;
    trace(m.y);
    m.z = 4;
    var z = m.z;
    trace(z);

    m.a = 5;
    trace(m.a);

    var b = m.y = m.z = 1;
    trace(b);
  }
}
