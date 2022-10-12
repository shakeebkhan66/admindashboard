import 'package:flutter/material.dart';
import '../../Constants/constant.dart';
import 'linear_chart.dart';


class Person {
  String? name;
  Color? color;
  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  State<PanelCenterPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelCenterPage> {

  final List<Person> _persons = [
    Person(name: "Aziz Bhai", color: Constants.orange),
    Person(name: "Wahid", color: Constants.red),
    Person(name: "Ahmer", color: Colors.blue),
    Person(name: "Angela Yu", color: Colors.amber),
    Person(name: "Mani Rao", color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  width: double.infinity,
                  child: const ListTile(
                    title: Text("Products Available", style: TextStyle(color: Colors.white),),
                    subtitle: Text(
                      "80% of Products Avail",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        "20,800",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ToDo Chart Middle
            const BarChartSample2(),

            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding,
                bottom: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: List.generate(_persons.length, (index) => ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: _persons[index].color,
                      child: Text(_persons[index].name.toString().substring(0,1), style: const TextStyle(color: Colors.white),),
                    ),
                    title: Text(
                      _persons[index].name.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.message, color: Colors.white,),
                    ),
                  )
                  ),
                ),
              ),
            )

          ],
        )
      ),
    );
  }
}