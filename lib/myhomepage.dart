
import 'package:flutter/material.dart';
import 'package:flutter_restapi_example/model/user.dart';
import 'package:flutter_restapi_example/services/user_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users=[];

  @override
  void initState()
  {
    super.initState();
    fetchUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3498db),
        title: Center(child: Text("Rest Api Call")),
      ),

      body:ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
            final user=users[index];
            final color=user.gender=="male"? Colors.blue : Colors.pink;
        return ListTile(
           title: Text(user.fullName),
          tileColor: color,
          subtitle: Text(user.location.state),
        );
      }),
    );
  }

  Future<void> fetchUsers() async{
    final response= await UserApi.fetchUsers();
    setState(() {
      users=response;
    });
  }

}
