class Base {
  public function new() {
  }
}

class Child extends Base {}

class OtherChild extends Base {}

typedef MyArray<T> = {
  public function pop(): T;
}

class Main {
  public static function main() {
    {
      var a = [new Child()];
      var b: MyArray<Base> = a;
    }
    {
      var children = [new Child()];
      // var bases: Array<Base> = children;
      var bases: Array<Base> = cast children;
      bases.push(new OtherChild());
      for (child in children) {
        trace(child);
      }
    }
  }
}
