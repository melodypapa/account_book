import 'package:flutter/foundation.dart';

class Deposit {
  int depositId;
  int bankId;

  Deposit({
    this.depositId,
    @required bankId,
  });
}
