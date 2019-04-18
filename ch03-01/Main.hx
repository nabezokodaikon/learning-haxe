typedef IA = Array<Int>;

typedef User = {
  var age: Int;
  var name: String;
}

typedef MyIterable<T> = {
  function iterator(): Iterator<T>;
}

typedef Measuable = {
  public var length(default, null): Int;
}

class Main {
  static public function main(): Void {
    {
      var user: User = { age: 26, name: "Tom" };
      trace(user);
      var ia: IA = [2];
      trace(ia);
      var ite: MyIterable<Int> = [1];
      trace(ite);
    }

    {
      equals(1, 1);
      equals("foo", "bar");
      // equals(1, "foo");
    }

    {
      trace(test([]));
      trace(test(["bar", "foo"]));

      trace(test2([]));
      trace(test2(["bar", "foo"]));
      // trace(test2("foo"));
    }
  }
  
  #if (haxe_ver >= 4)
  static function test<T: Iterable<String> & Measuable>(a: T) {
  #else
  static function test<T:(Iterable<String>, Measuable)>(a: T) {
  #end
    if (a.length == 0) {
      return "empty";
    } else {
      return a.iterator().next();
    }
  }

  static function test2<T:Iterable<String>>(a: T) {
    return a.iterator().next();
  }

  static function equals<T>(expected: T, actual: T) {
    if (actual != expected) {
      trace('$actual should be $expected');
    }
  }
}
