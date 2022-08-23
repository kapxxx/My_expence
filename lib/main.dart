import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_expence/model/transcation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transcation =[
    Transaction(id: '1',
        title: 'books',
        amount: 122.33,
        dateTime: DateTime.now()),
    Transaction(
        id: '2',
        title: 'leptop',
        amount: 200.22,
        dateTime: DateTime.now())
  ];
  @override

  final titlecontroller= TextEditingController();
  final amountController= TextEditingController();

  _addtransction(String title,double amount)
  {
    var newTr=Transaction(id: '3', title: title, amount: amount, dateTime: DateTime.now());
    setState(()
    {
      transcation.add(newTr);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('kapxx'),),
      body:

      Column(
        children: [

          Card(
            child: Column(
              children: [
                TextField(
                  controller: titlecontroller,
                  decoration: InputDecoration(hintText: 'title'),
                ), TextField(
                  controller: amountController,
                  decoration: InputDecoration(hintText: 'amount'),
                ),
                ElevatedButton(onPressed: () {

                  _addtransction(titlecontroller.text, double.parse(amountController.text)  );
                  print(titlecontroller.text);
                }, child: Text('submit'))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transcation.length,
              itemBuilder: (BuildContext context,int index )
              {
                return ListTile(
                  leading: Text('${transcation[index].id}'),
                  title: Text('${transcation[index].title}'),
                  subtitle: Text('${transcation[index].dateTime}'),
                  trailing: Text('${transcation[index].amount}'),

                );
              },
            ),
          ),
        ],

      )
    );
  }
}
