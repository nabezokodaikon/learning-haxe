import haxe.Constraints;

typedef IA = Array<Int>;

typedef User = {
  var age: Int;
  var name: String;
}

// typedef Iterable<T> = {
  // function iterator(): Iterator<T>;
// }

// class Array<T> {
  // function push(x: T): Int;
// }

typedef Measurable = {
  public var length(default, null): Int;
}

@:generic
class MyValue<T> {
  public var value: T;
  public function new(value: T) {
    this.value = value;
  }
}

class Main {
  @:generic
  static function method<T>(t: T) {}

  @:generic
  static function make<T: Constructible<String -> Void>>(): T {
    return new T("foo");
  }

  static public function main() {
    {
      var s: String = make();
      var t: haxe.Template = make();
    }
    {
      method("foo");
      method(1);
    }
    {
      var a = new MyValue<String>("Hello");
      var b = new MyValue<Int>(42);
    }
    {
      trace(test2([]));
      trace(test2(["bar", "foo"]));
    }
    {
      trace(test([]));
      trace(test(["bar", "foo"]));
    }
    {
      equals(1, 1);
      equals("foo", "bar");
      // equals(1, "foo");
    }
  }

  static function test2<T: Iterable<String>>(a: T) {
    a.iterator().next();
    return a.iterator().next();
  }

  #if(haxe_ver >= 4)
  static function test<T:Iterable<String> & Measurable>(a: T) {
  #else
  static function test<T:(Iterable<String>, Measurable)>(a: T) {
  #end
    if (a.length == 0) return "empty";
    return a.iterator().next();
  }

  static function equals<T>(expected: T, actual: T) {
    if (actual != expected) {
      trace('${actual} should be ${expected}');
    }
  }
}

