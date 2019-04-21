// extern class Math {
  // static var PI(default, null): Float;
  // static function floor(v: Float): Int;
// }

import haxe.extern.Rest;
import haxe.extern.EitherType;
using Main.IntExtender;

extern class MyExtern {
  static function f1(s: String, r: Rest<Int>): Void;
  static function f2(e: EitherType<Int, String>): Void;
}

class IntExtender {
  static public function triple(i: Int) {
    return i * 3;
  }
}

class Main {
  static public function main() {
    {
      var pi = Math.floor(Math.PI);
      // trace($type(pi));
    }

    {
      // MyExtern.f1("foo", 1, 2, 3);
    }

    {
      trace(12.triple());
    }

    {
      var myStructure = {
        name: "haxe",
        rating: "awesome"
      };

      var value = switch(myStructure) {
        case { name: "hexe", rating: "poor" }:
          throw false;
        case { rating: "awesome", name: n}:
          n;
        case _:
          "no awesome language found";
      }
      trace(value);
    }

    {
      var e = TString("fOo");
      var v = switch(e) {
        case TString(temp):
          switch(temp.toLowerCase()) {
            case "foo": true;
            case _: false;
          }
        case _: false;
      }
      trace(v);
    }

    {
      var e = TString("fOo");
      var s = switch(e) {
        case TString(_.toLowerCase() => "foo"):
          true;
        case _:
          false;
      }
      trace(s);
    }

    {
      var r = switch(3) {
        case add(_, 1) => mul(_, 3) => a:
          a;
      }
      trace(r);
    }

    {
      // var r = switch("foo") {
        // case (_.toLowerCase() == "foo"):
          // "foo or bar";
      // }
      // trace(r);

      // switch("foo") {
        // // Extractors in or patterns are not allowed
        // case (_.toLowerCase() => "foo") | "bar":
      // }
    }

    {
      // var fn = test.bind(1, _);
      // trace($type(fn));
      // fn('foo');
    }

    {
      MyClass.foo = 123;
    }
  }

  static function test(a: Int, ?b: String): Void {
    trace('$a, $b');
  }

  static function add(i1: Int, i2: Int) {
    return i1 + i2;
  }

  static function mul(i1: Int, i2: Int) {
    return i1 * i2;
  }
}

class MyClass {
  @:allow(Main.main)
  static private var foo: Int;
}

enum Test {
  TString(s: String);
  TInt(i: Int);
}
