class Expense
{
  String details;
  double value =9;

  Expense({this.details,this.value});

  Map<String, double> expense() => {
    "Food": 5,
    "Gadget": 3,
    "Health": 2,
    "Entertainment": 2,
  };
}