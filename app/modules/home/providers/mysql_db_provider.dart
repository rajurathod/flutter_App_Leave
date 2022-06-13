import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
  
class MysqlDbProvider extends GetConnect {
  
  @override
  void onInit() {}

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: '192.168.13.54',
        //host: '192.168.225.201',
        port: 3306,
        user: 'mobile',
        password: 'mobile@123',
        db: 'flutterdb');

    return await MySqlConnection.connect(settings);
  }

  Future Add_Project(
       projectName, projectLatitude, projectLongitude) async {
    print('we are in provider');
    var sql = "insert into projects(project_name,project_latitude,project_longitude)values('$projectName','$projectLatitude','$projectLongitude')";
    print(sql);
    await getConnection().then(
      (conn) async {
        var result = await conn.query(sql);
          print(result);

        conn.close();
        // await conn.query('insert into projets values(6,"banglore",2.8345,3.4325)');
      },
    );
  }


  Future Display_Projects()async{
    await getConnection().then((conn) async{
      conn.query('select * from projects').then((value){
        print(value.toString());
      });
      print(conn.toString());
      conn.close();
    });
  }

  // Future DisplayProjectsList() async {
  // print('inside provide');
  //   var sql = ('select project_id, project_name,project_latitude,project_longitude from projects');
  //   await getConnection().then(
  //      (conn) async {
  //       print(sql);
  //       await conn.query(sql);
  //       await conn.query('').then(
  //         (results) {
  //           print('Results$results');
  //           for (var res in results) {
  //             final Projects mylist = Projects(
  //               project_id:int.parse(res['project_id'].toString()) ,
  //               project_name: res['project_name'].toString(),
  //               project_latitude: (res['project_latitude'].toString()),
  //               project_longitude: (res['project_longitude'].toString()),
  //             );
  //             MyProjectList.add(mylist);
  //             print('first ${MyProjectList[0]}');

  //           }
  //         },        
  //       );
  //       conn.close();
  //     },
  //   );
  //   return MyProjectList;
  // }
}
