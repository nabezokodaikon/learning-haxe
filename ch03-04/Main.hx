class Base {
  public function new() {}
}

class Child extends Base {}

class OtherChild extends Base {}

typedef MyArray<T> = {
  public function pop(): T;
}

class Main {
  public static function main() {
    {
      var children = [new Child()];
      trace('$children');
      // var bases: Array<Base> = children;
      // trace('$bases');
    }

    {
      var children = [new Child()];
      var bases: Array<Base> = cast children;
      bases.push(new OtherChild());
      for (child in children) {
        trace('$child');
      }
    }

    {
      var a = [new Child()];
      var b: MyArray<Base> = a;
      var c = b.pop();
      trace('$c');
    } 
  }
}
