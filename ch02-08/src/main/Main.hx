abstract AbstractInt(Int) {
  inline public function new(i: Int) {
    this = i;
  }
}

abstract MyAbstract(Int) from Int to Int {
  inline function new(i: Int) {
    this = i;
  }

  @:from
  static public function fromString(s: String) {
    return new MyAbstract(Std.parseInt(s));
  }

  @:to
  public function toArray() {
    return [this];
  }
}

abstract A(Int) {
  public function new() this = 0;
  @to public function toB() return new B();
}

abstract B(Int) {
  public function new() this = 0;
  @to public function toC() return new C();
}

abstract C(Int) {
  public function new() this = 0;
}

abstract MyAbstract2(String) {
  public inline function new(s: String) {
    this = s;
  }

  @:op(A * B)
  public function repeat(rhs: Int): MyAbstract2 {
    var s: StringBuf = new StringBuf();
    for (_ in 0...rhs)
      s.add(this);
    return new MyAbstract2(s.toString());
  } 
}

abstract MyAbstract3(String) {
  public inline function new(s: String) {
    this = s;
  }

  @:op(++A)
  public function pre()
    return "pre" + this;
  @:op(A++)
  public function post()
    return this + "post";
}

abstract MyAbstract4(Int) from Int to Int {
  @:op(A > B)
  static function gt(a: MyAbstract4, b: MyAbstract4): Bool;
}

abstract AString(String) {
  public function new(s) this = s;
  @:arrayAccess function getInt1(k: Int) {
    return this.charAt(k);
  }
  @:arrayAccess function getInt2(k: Int) {
    return this.charAt(k).toUpperCase();
  }
}

@:enum
abstract HttpStatus(Int) {
  var NotFound = 404;
  var MethodNotAllowd = 405;
}

@:forward(push, pop)
abstract MyArray<S>(Array<S>) {
  public inline function new() {
    this = [];
  }
}

class Main {
  static function printStatus(status: HttpStatus) {
    return switch(status) {
      case NotFound:
        "Not found";
      case MethodNotAllowd:
        "Method not allowed";
    }
  }
  static public function main() {
    {
      var myArray = new MyArray();
      myArray.push(12);
      myArray.pop();
    }
    {
      var status = HttpStatus.NotFound;
      var msg = printStatus(status);
      trace(msg);
    }
    {
      var a = new AString("foo");
      trace(a[0]);
    }
    {
      var map = new Map();
      map["foo"] = 1;
      trace(map["foo"]);
    }
    {
      var a: MyAbstract4 = 42;
      if (a > 0) trace("Works fine, > operation implemented!");
      // if (a < 100) {}
    }
    {
      var a = new MyAbstract3("foo");
      trace(++a);
      trace(a++);
    }

    {
      var a = new MyAbstract2("foo");
      trace(a * 3);
    }

    {
      // var a = new A();
      // var b: B = a;
      // var c: C = b;
      // var c: C = a;
    }


    {
      var a = new AbstractInt(12);
      trace(a);
    }

    {
      var a: MyAbstract = 12;
      var b: Int = a;
    }

    {
      var a: MyAbstract = "3";
      var b: Array<Int> = a;
      trace(b);
    }
  }
}
