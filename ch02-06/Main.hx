class Main {
  static public function main() {
    trace("" + test(1, "hello") + "");
    // $type(test);
    trace("" + $type(test) + "");
    trace("" + $type(test(1, "foo")) + "");
    trace(test2());
    trace(test3());
    trace(test3(null));
  }

  static function test(i: Int, s: String): Bool {
    return true;
  }

  static function test2(?i: Int, ?s: String) {
    return "i: " + i + ", s: " + s;
  }

  static function test3(?i: Int = 12, s = "bar") {
    return "i: " + i + ", s: " + s;
  }
}

