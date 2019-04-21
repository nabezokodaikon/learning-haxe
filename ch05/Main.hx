class Main {
  static public function main() {
    {
      var a,b = "abc";
      a = "def";
      trace('$a, $b');
    }

    {
      var value = 1;
      function local(i) {
        return value + i;
      }
      trace(local(3));
    }

    {
      var a = cast "1";
      trace(a);

      var c = new Child(4);
      var b = cast(c, Base);
      trace(b);
    }

    {
      // var a = "11";
      // var r = (a: Int)
      // trace(r);
    }
  }
}

class Base {
  public var value = 3;
  public function new(v) {
    value = v;
  }
}

class Child extends Base {
}
