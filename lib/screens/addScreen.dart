import 'package:flutter/material.dart';

import 'addScreen_viewmodel.dart';

class Addscreen extends StatefulWidget {
  @override
  _AddscreenState createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  int type = 1;
  String dropdownValue = "Incomes";
  TextEditingController value = new TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: DropdownButton(
            value: dropdownValue,
            items: <String>['Incomes', 'Expenses']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (String newValue) {
              (newValue != dropdownValue)
                  ? setState(() {
                      dropdownValue = newValue;
                      type++;
                    })
                  : setState(() {});
            }),
      ),
      body: Center(
        child: Container(
            child: (type % 2 == 1) ? IncomeButton() : ExpenseButton()
        )
      ),
    );
  }
  buildMaterialButton(BuildContext context, IconData icon, String details,int type) {
    return MaterialButton(
      color: Colors.grey[300],
      shape: CircleBorder(),
      textColor: Colors.black,
      child: Icon(icon),
      onPressed: () {
        createAlertDialog(context, details,type);
      },
    );
  }
  createAlertDialog(BuildContext context, String details, int type) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(details),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Memo :',
                ),
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              TextField(
                controller: value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'RM :',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text("Done"),
              textColor: Colors.yellow[700],
              onPressed: () {
                if(type == 1)
                {}
                else if(type == 2)
                {}
              }
            )
          ],
        );
      });
  }
}

class IncomeButton extends StatelessWidget {
  final String parent = "Parents support",
      scholar = "Scholarship",
      income = "Side income",
      baitul = "Baitulmal";

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        childAspectRatio: 2,
        children: [
          _AddscreenState().buildMaterialButton(context, Icons.family_restroom, parent, 1),
          _AddscreenState().buildMaterialButton(context, Icons.school, scholar, 1),
          _AddscreenState().buildMaterialButton(context, Icons.vertical_align_bottom_rounded, income, 1),
          _AddscreenState().buildMaterialButton(context, Icons.volunteer_activism, baitul, 1),
          Text("\n$parent", textAlign: TextAlign.center),
          Text("\n$scholar", textAlign: TextAlign.center),
          Text("\n$income", textAlign: TextAlign.center),
          Text("\n$baitul", textAlign: TextAlign.center),
        ]);
  }
}

class ExpenseButton extends StatelessWidget {
  final String food = "Food",
      equip = "Equipment",
      save = "Saving",
      edu = "Education",
      tran = "Transport",
      ent = "Entertaiment",
      fit = "Fitness";

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        childAspectRatio: 2,
        children: [
          _AddscreenState().buildMaterialButton(context, Icons.fastfood, food, 2),
          _AddscreenState().buildMaterialButton(context, Icons.shopping_cart, equip, 2),
          _AddscreenState().buildMaterialButton(context, Icons.how_to_vote_sharp, save, 2),
          _AddscreenState().buildMaterialButton(context, Icons.menu_book, edu, 2),
          Text("\n$food", textAlign: TextAlign.center),
          Text("\n$equip", textAlign: TextAlign.center),
          Text("\n$save", textAlign: TextAlign.center),
          Text("\n$edu", textAlign: TextAlign.center),
          _AddscreenState().buildMaterialButton(context, Icons.local_taxi, tran, 2),
          _AddscreenState().buildMaterialButton(context, Icons.movie, ent, 2),
          _AddscreenState().buildMaterialButton(context, Icons.fitness_center, fit, 2),
          _AddscreenState().buildMaterialButton(context, Icons.local_library, fit, 2),
          Text("\n$tran", textAlign: TextAlign.center),
          Text("\n$ent", textAlign: TextAlign.center),
          Text("\n$fit", textAlign: TextAlign.center),
          Text("\nEducation", textAlign: TextAlign.center),
        ]);
  }
}





