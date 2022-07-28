class Transaction {
  final String id;
  final double amount;
  final String text;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.amount,
      required this.text,
      required this.date});
}
