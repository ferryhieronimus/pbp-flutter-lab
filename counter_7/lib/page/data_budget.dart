import 'package:flutter/material.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/model/budget.dart';

class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _DataBudgetState();
}

class _DataBudgetState extends State<DataBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: const DrawerApp(),
      body: Center(
          child: ListView.builder(
            itemCount: ListBudget.listBudget.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Material(
                      elevation: 3.0,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(ListBudget.listBudget[index].judul),
                          subtitle: Text(ListBudget.listBudget[index].nominal.toString()),
                          trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(ListBudget.listBudget[index].jenisBudget),
                              ]),
                        ),
                      )),
                ),
              );
            }),
          )),
    );
  }
}