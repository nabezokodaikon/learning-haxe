import haxe.Constraints;

@:generic
class MyValue<T> {
  public var value: T;
  public function new(value: T) {
    this.value = value;
  }
}

class Main {
  static public function main() {
    {
      var a = new MyValue<String>("Hello");
      trace('$a');
      var b = new MyValue(42);
      trace('$b');
    }

    {
      method("foo");
      method(1);
    }

    {
      var s: String = make();
      trace('$s');
      var t: haxe.Template = make();
      trace('$t');
    }
  }

  @:generic
  static function method<T>(t: T) {
    trace('$t');
  }

  @:generic
  static function make<T: Constructible<String ->Void>>(): T {
    return new T("foo");
  }
}
