class Expense
{
  String details;
  double value;
  String id;
  String userId;
  String month;

  Expense({this.id,this.userId,this.details,this.value,this.month});

  Expense.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'].toString(),  
          userId: json['userId'].toString(),
          details: json['details'].toString(),
          value: json['value'].toDouble(),
          month: json['month'].toString());

  Map<String, dynamic> toJson() =>
      {'id': id, 'userId': userId, 'details': details, 'value': value, 'month': month};
      
  Map<String, double> expense() => {
    "Food": 5,
    "Gadget": 3,
    "Health": 2,
    "Entertainment": 2,
  };
}