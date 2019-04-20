class MyClass {
  static public function available() {
    unavaliable();
  }
  static private function unavaliable() {
  }
}

class Base {
  public function new() {}
  private function baseField() {}
}

class Child1 extends Base {
  private function child1Field() {}
}

class Child2 extends Base {
  private function child2Field() {
    var child1 = new Child1();
    child1.baseField();
    // child1.child1Field();
  }
}

class Main {

  static inline function mid(s1: Int, s2: Int) {
    return (s1 + s2) / 2;
  }

  static function test() {
    if (Math.random() > 0.5) {
      return "ok";
    } else {
      error("random failed");
    }
  }

  @:extern
  static inline function error(s: String) {
    throw s;
  }

  static dynamic function dynamicTest() {
    return "original";
  }

  static public function main() {
    MyClass.available();
    // MyClass.unavaliable();
    var a = 1;
    var b = 2;
    var c = mid(a, b);
    trace(c);

    // test();

    trace(dynamicTest());
    dynamicTest = function() { return "new"; }
    trace(dynamicTest());
  }
}
