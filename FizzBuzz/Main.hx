abstract FizzBuzzType(Int) {
  function new(i: Int) {
    this = i;
  }

  @:from
  public static function fromInt(i: Int) {
    return new FizzBuzzType(i);
  }

  @:to
  public function toString(): String {
    return
      if (this % 15 == 0) {
        "FizzBuzz";
      } else if(this % 3 == 0) {
        "Fizz";
      } else if (this % 5 == 0) {
        "Buzz";
      } else {
        Std.string(this);
      }
  }
}

class Main {
  static public function main() {
    for (i in 1...100) {
      var f: FizzBuzzType = i;
      trace(f);
    }
  }
}
