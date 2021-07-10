import 'package:cloud_firestore/cloud_firestore.dart';

class Todo{

  late String title;
  late DateTime createdAt;

  Todo(DocumentSnapshot<Map<String,dynamic>> doc){
    this.title = doc.data()!["title"];
    final Timestamp timestamp = doc.data()!['createdAt'];
    this.createdAt = timestamp.toDate();
    // this.createdAt = doc.data()!['createdAt'];
  }
}