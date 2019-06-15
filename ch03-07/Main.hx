import haxe.ds.StringMap;
import haxe.macro.Expr;
import Math.random;
import haxe.macro.*;
import String.fromCharCode in f;
import a.A;

class Main {
  static function main() {
    {
      var c1 = f(65);
      var c2 = f(66);
      trace(c1 + c2);
    }
    {
      var expr: Expr = null;
      trace(expr);
    }
    {
      var r = random();
      trace(r);
    }
    {
      var e: Binop = OpAdd;
      trace(e);
    }
    {
      new StringMap();
    }
    {
      var subtype1 = new a.A.B();
      trace(subtype1);

      var subtype2 = new B();
      trace(subtype2);

      var subtype3 = new a.B();
      trace(subtype3);
    }
  }
}
