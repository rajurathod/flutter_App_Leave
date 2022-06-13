import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj3/app/modules/home/providers/mysql_db_provider.dart';
import 'package:proj3/app/modules/home/views/add_division_view.dart';
import 'package:proj3/app/modules/home/views/division_model_view.dart';
 
class DivisionDashboardView extends GetView {
  MysqlDbProvider connection = MysqlDbProvider();
  final List<Division> list = [];

  Future Add_Division() async {
    var sql1 = ('insert into division values(10,"cse",2)');
    await connection.getConnection().then(
      (conn) async {
        print('success1');
        await conn.query(sql1);
        await conn.query('').then(
          (result) {
            print('divResults$result');
          },
        );
      },
    );
  }

  Future getmySQLData() async {
    var sql = ('select division_id, division_name,project_id from division');
    await connection.getConnection().then(
      (conn) async {
       // print('success');
        await conn.query(sql);
        await conn.query('').then(
          (results) {
            print('Results$results');
            for (var res in results) {
              final Division mylist = Division(
                division_id:int.parse(res['division_id'].toString()) ,
                division_name: res['division_name'].toString(),
                project_id: int.parse(res['project_id'].toString()),
               
              
              );
              list.add(mylist);
              print('first ${list[0]}');
          
            }
          },
        
        );

        conn.close();
      },
    );

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIVISION DASHBOARD'),
        actions: [IconButton(onPressed: (){Get.to(AddDivisionView());}, icon: const Icon(Icons.add),),],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlatButton(
            onPressed: getmySQLData,
            child: const Text('Division_List'),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount:list.length,
            itemBuilder: (BuildContext context, int index) {

         
              return Card(child: Column(
                
                children: [
                  Text(list[index].division_id.toString()),
                  Text(list[index].division_name),
                  Text(list[index].project_id.toString())
                  
                ],
                

              ),);
              
            },
          ),
          ], 
        ),
      ),
    );
  }
}
