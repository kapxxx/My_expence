import 'dart:ffi';

class Transaction
{
  final String id;
  final String title;
  final double amount;
  final String? decs;
  final DateTime dateTime;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    this.decs,
    required this.dateTime,

});

}