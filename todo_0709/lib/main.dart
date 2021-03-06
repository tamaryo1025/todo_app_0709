import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_page.dart';
import 'main_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
class MainPage extends StatelessWidget{
   // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..getTodoListRealTime(),
        child: Scaffold(
        appBar: AppBar(
          
          title: Text("TODO app"),
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          final todoList = model.todoList;
            return ListView(
              children: todoList.map(
                (todo) => ListTile(
                title: Text(todo.title),
              ),
              ).toList()
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () async {
         await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addpage(),
            fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
          ),
      );
  }
}

