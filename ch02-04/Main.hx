enum Color {
  Red;
  Green;
  Blue;
  Rgb(r: Int, g: Int, b: Int);
}

class Main {
  static public function main(): Void {
    trace(Color.Red);
    trace(Color.Rgb(1, 2, 3));

    var ec: EnumValue = Color.Red;
    trace(ec);
    var en: Enum<Color> = Color;
    trace(en);

    var color = getColor();
    switch (color) {
      case Red: trace("Color was red");
      case Green: trace("Color was green");
      case Blue: trace("Color was blue");
      case Rgb(r, g, b): trace('${r}, ${g}, ${b}');
    }
  }

  static function getColor(): Color {
    return Rgb(255, 0, 255);
  }
}
