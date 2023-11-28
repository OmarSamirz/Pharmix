import 'package:intl/intl.dart';
import 'package:pharmix/models/order.dart';

var now = DateTime.now();

var afterMinutes = now.add(const Duration(minutes: 30));


var order1 = Order(
  1,
  150 - 0.001,
  true,
  DateTime.now(),
  false,
  false,
  false,
  DateFormat('hh:mm a').format(now),
  DateFormat('hh:mm a').format(afterMinutes),
);

var orderList = [
  order1,
  order1,
  order1,
  order1,
  order1,
];
