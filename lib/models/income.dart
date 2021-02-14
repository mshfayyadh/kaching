class Income
{
  String details;
  double value;
  String id;
  String userId;
  String month;

  Income({this.id,this.userId,this.details,this.value,this.month});

  Income.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'].toString(),  
          userId: json['userId'].toString(),
          details: json['details'].toString(),
          value: json['value'].toDouble(),
          month: json['month'].toString());

  Map<String, dynamic> toJson() =>
      {'id': id, 'userId': userId, 'details': details, 'value': value, 'month': month};

  Map<String, double> income() => {
    "Shcolarship": 5,
    "Parent support": 3,
    "Side income": 2,
    "Baitulmal": 2,
  };
}