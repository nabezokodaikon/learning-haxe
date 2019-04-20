class Base {
  public function new() {}
  public function myMethod() {
    return "Base";
  }
}

class Child extends Base {
  public override function myMethod() {
    return "Child";
  }

  public function callHome() {
    return super.myMethod();
  }

  private function method(obj: Child): Child {
    return obj;
  }
}

class ChildChild extends Child {
  public override function method(obj: Base): ChildChild {
    return null;
  }
}

class Main {
  static public function main(): Void {
    trace("Hello World");
    myFunc("foo", 1);

    var child: Base = new Child();
    trace(child.myMethod());
    var child2 = new Child();
    trace(child2.callHome());
  }

  static function myFunc(f: String, i) {
    return true;
  }
}
