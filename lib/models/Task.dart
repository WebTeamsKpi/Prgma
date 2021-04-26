import 'package:prgma/models/User.dart';

class Task{
  DateTime deadline = new DateTime.now();
  String description="dsadsadddddddddddddddddddddddsadsadasasd";
  String title="dsa";
  List<User> contributor=[User(name:"Roflan",id: "SAD",password: "SAD",)];
  Task({this.title,this.description,this.deadline,this.contributor});
}