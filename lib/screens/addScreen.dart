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
            (newValue!=dropdownValue) ? setState(() {
              dropdownValue = newValue;
              type++;
              })
              : setState(() {});
          }
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

  final String parent="Parents support",scholar="Scholarship",income="Side income",baitul="Baitulmal";

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      childAspectRatio: 2,
      children: [
        buildMaterialButton(context,Icons.family_restroom,parent),
        buildMaterialButton(context,Icons.school,scholar),
        buildMaterialButton(context,Icons.vertical_align_bottom_rounded,income),
        buildMaterialButton(context,Icons.volunteer_activism,baitul),
        Text("\n$parent", textAlign: TextAlign.center),
        Text("\n$scholar", textAlign: TextAlign.center),
        Text("\n$income", textAlign: TextAlign.center),
        Text("\n$baitul", textAlign: TextAlign.center),
      ]
    );
  }

  MaterialButton buildMaterialButton(BuildContext context,IconData icon,String details) {
    return MaterialButton(
        color: Colors.grey[300],
        shape: CircleBorder(),
        textColor: Colors.black,
        child: Icon(icon),
        onPressed: (){
          createAlertDialog(context,details);
        },
      );
  }
}

class ExpenseButton extends StatelessWidget {
  const ExpenseButton({
    Key key,
  }) : super(key: key);

  final String food="Food",equip="Equipment",save="Saving",edu="Education",tran="Transport",ent="Entertaiment",fit="Fitness";

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      childAspectRatio: 2,
      children: [
        buildMaterialButton(context,Icons.fastfood,food),
        buildMaterialButton(context,Icons.shopping_cart,equip),
        buildMaterialButton(context,Icons.how_to_vote_sharp,save),
        buildMaterialButton(context,Icons.menu_book,edu),
        Text("\n$food", textAlign: TextAlign.center),
        Text("\n$equip", textAlign: TextAlign.center),
        Text("\n$save", textAlign: TextAlign.center),
        Text("\n$edu", textAlign: TextAlign.center),
        buildMaterialButton(context,Icons.local_taxi,tran),
        buildMaterialButton(context,Icons.movie,ent),
        buildMaterialButton(context,Icons.fitness_center,fit),
        buildMaterialButton(context,Icons.local_library,fit),
        Text("\n$tran", textAlign: TextAlign.center),
        Text("\n$ent", textAlign: TextAlign.center),
        Text("\n$fit", textAlign: TextAlign.center),
        Text("\nEducation", textAlign: TextAlign.center),
      ]
    );
  }

  MaterialButton buildMaterialButton(BuildContext context,IconData icon,String details) {
    return MaterialButton(
        color: Colors.grey[300],
        shape: CircleBorder(),
        textColor: Colors.black,
        child: Icon(icon),
        onPressed: (){
          createAlertDialog(context,details);
        },
      );
  }
}

createAlertDialog(BuildContext context,String details){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              details,
              //style: TextStyle(color: Colors.yellow[700]),
            ),
            SizedBox(height: 10),
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