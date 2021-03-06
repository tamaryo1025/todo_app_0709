import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_0709/todo.dart';




class MainModel extends ChangeNotifier{
  List<Todo> todoList=[];
  late StreamSubscription sub;

  Future getTodoList() async{
    final snapshot = await FirebaseFirestore.instance.collection('todoList').get();
    final docs = snapshot.docs;
    final todoList = docs.map((doc) => Todo(doc)).toList();
    this.todoList = todoList;
    notifyListeners();
  }

  void getTodoListRealTime() {
    final snapshots = FirebaseFirestore.instance.collection('todoList').snapshots();
    sub = snapshots.listen((snapshot){
      final docs = snapshot.docs;
      final todoList = docs.map((doc) => Todo(doc)).toList();
      todoList.sort((a,b) => b.createdAt.compareTo(a.createdAt));
      this.todoList = todoList;
      notifyListeners();
    }
    );
  }
  // dispose は ChangeNotifierが使われなくなるタイミングでよばれる。
  @override
  void dispose(){
    sub.cancel();
    super.dispose();
  }
}