class Main {
  public var ro(default, null): Int;

  public var wo(null, default): Int;

  public var x(get, set): Int;

  public var y(get, never): Int;

  public function get_x() {
    return field;
  }

  public function set_x(x) {
    return field = x;
  }

  public function get_y() {
    return field2;
  }

  var field = 1;
  var field2 = 2;

  function new() {
    trace('ro: $ro');
    trace('wo: $wo');
    trace('x: $x');
    trace('y: $y');

    trace("--------");

    ro = 3;
    trace('ro: $ro');

    wo = 3;
    trace('wo: $wo');

    x = 3;
    trace('x: $x');

    // y = 3;
    trace('y: $y');
    
    trace("--------");

    var v = x;
    x = 2;
    x += 1;
    trace(x);

    // y = x;
  }
   
  static public function main() {
    new Main();
  }
}
