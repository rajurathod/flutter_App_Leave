import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:proj3/app/modules/home/providers/mysql_db_provider.dart';

class EmployeeDetailsView extends GetView {
 MysqlDbProvider connection = MysqlDbProvider();

Future<List> getmySQLData() async {
  var sql = ('select division_name from division where project_id= 1');
  
  final List mylist = [];
  await connection.getConnection().then((conn) async {
    print('success');
    await conn.query(sql);
    await conn.query('').then((results) {
      print('Results${results}');
      for (var res in results) {
        Text(res['division_name'].toString());
        // final UserModel myuser = UserModel(
        //     userId: res['password'].toString(),
        //     username: res['username'].toString(),
        //     email: res['email'].toString());

        // mylist.add(myuser);
      }
    }).onError((error, stackTrace) {
      print(error);

      return null;
    });

    conn.close();
  });

  return mylist;
}

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DIVISION DASHBOARD'),
        actions: [Icon((Icons.add))],
      ),
      body:FlatButton(child: Text('pess'),onPressed: getmySQLData,),
    );
  }
}

