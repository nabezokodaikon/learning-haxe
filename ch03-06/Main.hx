import haxe.Constraints;

class Main {
  public static function main() {
    {
      var x = null;
      trace($type(x));
      x = "foo";
      trace($type(x));
    }

    {
      var x = [];
      trace($type(x));
      x.push("foo");
      trace($type(x));
    }

    {
      var a: Array<Dynamic> = [1, "foo"];
      trace('$a');
    }

    {
      var s: String = make();
      trace('$s');
      var t: haxe.Template = make();
      trace('$t');
    }
  }

  @:generic
    static function make<T: Constructible<String -> Void>>(): T {
    return new T("foo");
  }
}
