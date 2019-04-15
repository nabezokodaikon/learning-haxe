class Main {

  static function foo(x: Int = 0) {
    return x + 1;
  }

  static function bar(?y: Int) {
    return y;
  }

  static public function main(): Void {
    var foo = foo();
    trace(foo);

    var bar = bar();
    trace(bar);
  }
}

