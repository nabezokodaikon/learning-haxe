// class ImplementsDynamic
  // implements Dynamic<String> {
  // public var present: Int;
  // public function new() {}
// }

// class Resolve implements Dynamic<String> {
  // public var present: Int;
  // public function new {}
  // function resolve(field: String) {
    // return "Tried to resolve" + field;
  // }
// }

abstract Any(Dynamic) from Dynamic to Dynamic {}

class Main {
  static function setAnyValue(value: Any) {
    trace(value);
  }

  static function getAnyValue(): Any {
    return 42;
  }

  static public function main() {
    setAnyValue("someValue");
    setAnyValue(42);

    var value = getAnyValue();
    trace(value);

    if (Std.is(value, String)) {
      trace((value: String).charCodeAt(0));
    }

    // var user: haxe.DynamicAccess<Dynamic> = {};
    // user.set("name", "Mark");
    // user.set("age", 25);
    // trace(user.get("name"));
    // trace(user.get("age"));
    // trace(user.exists("name"));
    // trace(user.exists("name"));
    // var c = new Resolve();
    // c.present = 2;
    // trace(c.present);
    // trace(c.resolveMe);
    // $type(test);
    // $type(test(1, "foo"));

    // trace(test());
    // trace(test2(1, "foo"));
    // trace(test2("foo"));

    // $type(test3);
    // trace(test3(1));
    // trace(test3(1, "foo"));
    // trace(test3("foo"));

    // var d: Dynamic = 1;
    // trace(d.foo);

    // var jsonData = '[1, 2, 3]';
    // var json = haxe.Json.parse(jsonData);
    // // $type(json);
    // trace(json);
    // for (i in 0...json.length) {
      // // trace(json[i]);
    // }
    // var c = new ImplementsDynamic();
    // c.present = 1;
    // c.stringField = "foo";
  }

  static function test(i: Int, s: String): Bool {
    return true;
  }

  static function test2(?i: Int, ?s: String) {
    return 'i: ${i}, s: ${s}';
  }

  static function test3(?i = 12, s = "bar") {
    return 'i: ${i}, s: ${s}';
  }

  static function test4(i = 12, s = "bar") {
    // if (i = null) i = 12;
    // if (s = null) s = "bar";
    return 'i: ${i}, s: ${s}';
  }
}
