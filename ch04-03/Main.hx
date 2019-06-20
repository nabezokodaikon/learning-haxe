class Base {
  public function new() {}
  public function myMyethod() {
    return "Base";
  }
}

class Child extends Base {
  public override function myMyethod() {
    return "Child";
  }

  public function callHome() {
    return super.myMyethod();
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
  static function myFunc(f: String, i) {
    return true;
  }

  static public function main(): Void {
    {
      var child = new Child();
      trace(child.callHome());
    }
    {
      var c: Base = new Child();
      trace(c.myMyethod());
    }
    {
      trace("Hello World");
      trace(myFunc("foo", 1));
    }
  }
}
