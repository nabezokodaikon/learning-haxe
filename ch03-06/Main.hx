import haxe.Constraints;

class Main {
  @:generic
  static function make<T: Constructible<String -> Void>>(): T {
    return new T("foo");
  } 

  public static function main() {
    {
      var s: String = make();
      trace(s);
      var t: haxe.Template = make();
      trace(t);
    }
    {
      var a: Array<Dynamic> = [1, "foo"];
      $type(a);
    }
    {
      var x = [];
      $type(x);
      x.push("foo");
      $type(x);
    }
    {
      var x = null;
      $type(x);
      x = "foo";
      $type(x);
    }
  }
}
