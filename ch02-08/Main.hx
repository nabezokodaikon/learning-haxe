abstract AbstractInt(Int) {
  inline public function new(i: Int) {
    this = i;
  }
}

abstract MyAbstract(Int) from Int to Int {
  inline function new(i: Int) {
    this = i;
  }
}

abstract MyAbstract2(Int) {
  inline function new(i: Int) {
    this = i;
  }

  @:from
  static public function fromString(s: String) {
    return new MyAbstract2(Std.parseInt(s));
  }

  @:to
  public function toArray() {
    return [this];
  }
}

abstract A(Int) {
  public function new() this = 1;
  @:to public function toB() return new B();
}

abstract B(Int) {
  public function new() this = 2;
  @:to public function toC() return new C();
}

abstract C(Int) {
  public function new() this = 3;
}

class Main {
  static public function main() {
    {
      var a = new A();
      trace(a);
      var b: B = a;
      trace(b);
      var c: C = b;
      trace(c);
      // var d: C = a;
      // trace(d);
    }

    {
      var a = new AbstractInt(12);
      trace(a);
    }

    {
      var a: MyAbstract = 12;
      var b: Int = a;
      trace(b);
    }

    {
      var a: MyAbstract2 = "3";
      var b: Array<Int> = a;
      trace(b);
    }
  }
}
