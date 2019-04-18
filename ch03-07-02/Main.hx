import haxe.ds.StringMap;
// import haxe.macro.Expr.Binop;
import haxe.macro.*;
import Math.random;
import String.fromCharCode in f;

class Main {
  static public function main() {
    {
      new StringMap();
    }

    {
      // var e: Binop = OpAdd;
      // trace('$e');
    }

    {
      trace("日本");
    }

    {
      var r = random();
      trace('$r');
    }

    {
      var expr: Expr = null;
    }

    {
      var c1 = f(65);
      var c2 = f(66);
      trace('$c1, $c2');
    }
  }
}
