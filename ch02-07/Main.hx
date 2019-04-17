class Main {
  static var d: Dynamic = 1;
  static function main() {
    trace(d);

    var jsonData = '[1, 2, 3]';
    var json: Dynamic = haxe.Json.parse(jsonData);
    // $tmype(json);
    for (i in 0...json.length) {
      trace(json[i]);
    }

    var c = new ImplementsDynamic();
    c.present = 1;
    c.stringField = "foo";
    c.stringField2 = "bar";
    // c.intField = 1;
    trace(c);

    var d = new Resolve();
    d.present = 2;
    trace(d.present);
    trace(d.resolveMe);

    var user: haxe.DynamicAccess<Dynamic> = {};
    user.set("name", "Mark");
    user.set("age", 25);

    trace(user.get("name"));
    trace(user.get("age"));

    trace(user.exists("name"));

    setAnyValue("someValue");
    setAnyValue(42);

    var value = getAnyValue();
    trace($type(value));

    if (Std.is(value, String)) {
      trace((value: String).charCodeAt(0));
    }
  }

  static function setAnyValue(value: Any) {
    trace(value);
  }

  static function getAnyValue(): Any {
    return 42;
  }
}

abstract Any(Dynamic) from Dynamic to Dynamic {}

class ImplementsDynamic
  implements Dynamic<String> {
  public var present: Int;
  public function new() {}
}

class Resolve implements Dynamic<String> {
  public var present: Int;
  public function new() {}
  function resolve(field: String) {
    return "Tried to resolve " + field;
  }
}
