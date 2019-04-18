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

abstract MyAbstract3(String) {
  public inline function new(s: String) {
    this = s;
  }

  @:op(A * B)
  public function repeat(rhs: Int): MyAbstract3 {
    var s: StringBuf = new StringBuf();
    for (i in 0...rhs) {
      s.add(this);
    }
    return new MyAbstract3(s.toString());
  }
}

abstract MyAbstract4(String) {
  public inline function new(s: String) {
    this = s;
  }

  @:op(++A)
  public function pre() {
    return "pre" + this;
  }

  @:op(A++)
  public function post() {
    return this + "post";
  }
}

abstract MyAbstractInt(Int) from Int to Int {
  @:op(A > B)
  static function gt(a: MyAbstractInt, b: MyAbstractInt): Bool;

  @:op(A < B)
  static function lt(a: MyAbstractInt, b: MyAbstractInt): Bool;
}

// abstract MyArray<K, V>(Int) {
  // @:arrayAccess
  // public inline function get(key: K) {
    // return this.get(key);
  // }
  // @:arrayAccess
  // public inline function arrayWrite(k: K, v: V): V {
    // this.set(k, v);
    // return v;
  // }
// }

abstract AString(String) {
  public function new(s) {
    this = s;
  }

  @:arrayAccess
  function getInt1(k: Int) {
    return this.charAt(k);
  }

  @:arrayAccess
  function getInt2(k: Int) {
    return this.charAt(k).toUpperCase();
  }
}

@:enum
abstract HttpStatus(Int) {
  var NotFound = 404;
  var MehodNotAllowd = 405;
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

    {
      var a = new MyAbstract3("foo");
      trace(a * 3);
    }

    {
      var a = new MyAbstract4("foo");
      trace(++a);
      trace(a++);
    }

    {
      var a: MyAbstractInt = 42;
      if (a > 0) {
        trace("Works fine, > operation implemented!");
      }

      if (a < 100) {
        trace("" + a + "");
      }
    }

    {
      var map = new Map();
      map["foo"] = 100;
      trace(map["foo"]);
    }

    {
      var a = new AString("foo");
      trace(a[0]);
    }

    {
      var status = HttpStatus.NotFound;
      var msg = printStatus(status);
      trace(msg);
    }

    {
      var myArray = new MyArray();
      trace(myArray);
      myArray.push(12);
      trace(myArray);
      var pop = myArray.pop();
      trace(myArray);
      trace(pop);
    }
  }

  static function printStatus(status: HttpStatus) {
    return switch(status) {
      case NotFound:
        "Not found";
      case MehodNotAllowd:
        "Mehod not allowd";
    }
  }
}

@:forward(push, pop)
abstract MyArray<S>(Array<S>) {
  public inline function new() {
    this = [];
  }
}
