class Main {
  static public function main() {
    {
      var a,b = "abc";
      a = "def";
      trace('$a, $b');
    }

    {
      var value = 1;
      function local(i) {
        return value + i;
      }
      trace(local(3));
    }
  }
}
