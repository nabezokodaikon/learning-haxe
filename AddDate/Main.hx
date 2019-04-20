abstract AbsDate(Date) from Date to Date {
  @:op(A + B)
  public inline function add(step: Int): AbsDate {
    return Date.fromTime(this.getTime() + (86400000 * step));
  }

  public inline function concretization(): Date {
    return this;
  }
}

@:forward
abstract AbsDate2(Date) from Date to Date {
  @:op(A + B)
  public inline function add(step: Int): AbsDate2 {
    return Date.fromTime(this.getTime() + (86400000 * step));
  }
}

class Main {
  static function main() {

    trace(Date.fromTime(new Date(2019, 4, 20, 0, 0, 0).getTime()));


    var date: AbsDate = new Date(2019, 4, 20, 0, 0, 0);
    trace(date);
    trace(date + 1);
    trace(date + 2);
    trace(date + 3);

    trace((date + 1).concretization().getTime());

    var date2: AbsDate2 = new Date(2019, 4, 20, 0, 0, 0);
    trace(date2);
    trace(date2 + 1);
    trace(date2 + 2);
    trace(date2 + 3);

    trace((date2 + 1).getTime());
  }
}
