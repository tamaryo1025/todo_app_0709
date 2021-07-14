import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_model.dart';
import 'add_model.dart';

class Addpage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
        create: (_) => AddModel(),
        child: Scaffold(
        appBar: AppBar(
          
          title: Text("新規追加"),
        ),
        body: Consumer<AddModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                TextField(
                  onChanged: (text){
                    model.todoText = text;
                  },
                ),
                
              ElevatedButton(
                child: Text('追加する'),
                onPressed: () async{
                    await model.add();
                },
                ),
              ],
              ),
            );
          }
        ),
          ),
      );
  }
}