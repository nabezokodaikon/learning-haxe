typedef Point = {
  x: Int,
  y: Int
}

typedef Point3 = {
  > Point,
  z: Int
}

class Path {
  var start: { x: Int, y: Int };
  var target: Point;
}

typedef User = {
  age: Int,
  name: String,
  ?phoneNumber: String
}

typedef User2 = {
  var age: Int;
  var name: String;
  @:optional var phoneNumber: String;
}

class Main {
  static public function main() {
    var myStructure = { x: 12, name: "foo" };
    trace("" + myStructure + "");    
    myStructure.x = 1;
    trace("" + myStructure + "");    

    var p: Point = { x: 1, y: 2};
    trace("" + p + "");    

    var p3: Point3 = { x: 1, y: 2, z: 3 };
    trace("" + p3 + "");    

    var pj: Point = { "x": 2, "y": 4 };
    trace("" + pj.x + "");    

    var user1: User = { age: 10, name: "taro", phoneNumber: "110" };
    trace("" + user1 + "");    
    var user2: User = { age: 10, name: "taro", phoneNumber: "110" };
    trace("" + user2 + "");    

    var array = [1, 2, 3];
    var t: IterableWithLength<Int> = array;
    trace("" + t.length + "");    

    var t2: IterableWithLengthAndPush<Int> = array;
    t2.push(1);
    trace("" + t2.length + "");    
  }
}

typedef IterableWithLength<T> = {
  > Iterable<T>,
  var length(default, null): Int;
}

typedef WithLength = {
  var length(default, null): Int;
}

typedef IterableWithLengthAndPush<T> = {
  > Iterable<T>,
  > WithLength
  function push(a: T): Int;
}
