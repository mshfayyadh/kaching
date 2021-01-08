import 'package:flutter/material.dart';

class Addscreen extends StatefulWidget {

  @override
  _AddscreenState createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  int type = 1;
  String dropdownValue = "Incomes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back,color: Colors.black),
        title: DropdownButton(
          value: dropdownValue,
          items: <String>['Incomes', 'Expenses'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(), 
          icon: Icon(Icons.arrow_drop_down), 
          onChanged: (String newValue) {
            setState(() {dropdownValue = newValue;type++;});
          },
        ),        
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: (type%2==1) ? IncomeButton() : ExpenseButton()
        )
      ),
    );
  }
}

class IncomeButton extends StatelessWidget {
  const IncomeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      childAspectRatio: 2,
      children: [
        buildMaterialButton(context,Icons.family_restroom),
        buildMaterialButton(context,Icons.school),
        buildMaterialButton(context,Icons.vertical_align_bottom_rounded),
        buildMaterialButton(context,Icons.volunteer_activism),
        Text("\nParents support", textAlign: TextAlign.center),
        Text("\nScholarship", textAlign: TextAlign.center),
        Text("\nSide income", textAlign: TextAlign.center),
        Text("\nBaitulmal", textAlign: TextAlign.center),
      ]
    );
  }

  MaterialButton buildMaterialButton(BuildContext context,IconData icon) {
    return MaterialButton(
        color: Colors.grey[300],
        shape: CircleBorder(),
        textColor: Colors.black,
        child: Icon(icon),
        onPressed: (){
          createAlertDialog(context);
        },
      );
  }
}

class ExpenseButton extends StatelessWidget {
  const ExpenseButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      childAspectRatio: 2,
      children: [
        buildMaterialButton(context,Icons.fastfood),
        buildMaterialButton(context,Icons.shopping_cart),
        buildMaterialButton(context,Icons.how_to_vote_sharp),
        buildMaterialButton(context,Icons.menu_book),
        Text("\nFood", textAlign: TextAlign.center),
        Text("\nSelf-\nequipment", textAlign: TextAlign.center),
        Text("\nSaving", textAlign: TextAlign.center),
        Text("\nEducation", textAlign: TextAlign.center),
        buildMaterialButton(context,Icons.local_taxi),
        buildMaterialButton(context,Icons.movie),
        buildMaterialButton(context,Icons.fitness_center),
        buildMaterialButton(context,Icons.local_library),
        Text("\nTransportation", textAlign: TextAlign.center),
        Text("\nEntertaiment", textAlign: TextAlign.center),
        Text("\nFitness", textAlign: TextAlign.center),
        Text("\nEducation", textAlign: TextAlign.center),
      ]
    );
  }

  MaterialButton buildMaterialButton(BuildContext context,IconData icon) {
    return MaterialButton(
        color: Colors.grey[300],
        shape: CircleBorder(),
        textColor: Colors.black,
        child: Icon(icon),
        onPressed: (){
          createAlertDialog(context);
        },
      );
  }
}

createAlertDialog(BuildContext context){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Memo :',
              ),
            controller: TextEditingController(),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'RM :',
              ),
            controller: TextEditingController(),
            ),
          ],
        ),
        actions: <Widget>[
          MaterialButton(child: Text("Done"),textColor: Colors.yellow[700], onPressed: (){})
        ],
      );
    });
  }