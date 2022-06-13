import 'package:get/get.dart';
import 'package:proj3/app/modules/home/views/project_model_view.dart';
import '../providers/mysql_db_provider.dart';

class HomeController extends GetxController {
  var selectedDrowpdown = 'Bangalore';
 //List dropdownText = ['1', '2', '3'];
  final count = 0.obs;
  List<Projects> MyProjectList =[];
  List dropdownText =[];

  Future Add_Project(
       projectName, projectLatitude, projectLongitude) async {
    print('controller');
    var result = MysqlDbProvider().Add_Project(
         projectName, projectLatitude, projectLongitude);
    return result;
  }

  Future DisplayProjectsList() async {
  print('inside provide');
    var sql = ('select project_id, project_name,project_latitude,project_longitude from projects');
    await MysqlDbProvider().getConnection().then(
       (conn) async {
        print(sql);
        await conn.query(sql);
        await conn.query('').then(
          (results) {
            print('Results$results');
            for (var res in results) {
              final Projects mylist = Projects(
                project_id:int.parse(res['project_id'].toString()) ,
                project_name: res['project_name'].toString(),
                project_latitude: (res['project_latitude'].toString()),
                project_longitude: (res['project_longitude'].toString()),
              );
              MyProjectList.add(mylist);
              print('first ${MyProjectList[0]}');

            }
          },        
        );
        conn.close();
      },
    );
    return MyProjectList;
  }

  Future ProjectsList() async {
  print('inside provide');
    var sql = ('select  project_name, from projects');
    await MysqlDbProvider().getConnection().then(
       (conn) async {
        print(sql);
        await conn.query(sql);
        await conn.query('').then(
          (results) {
            print('Results$results');
            for (var res in results) {
              final Projects mylist = Projects(               
                project_name: res['project_name'].toString(),
              );
              dropdownText.add(mylist);
              print('first ${dropdownText[0]}');

            }
          },        
        );
        conn.close();
      },
    );
    return dropdownText;
  }



  Future<void> Delete_Project ()async {

  

  await MysqlDbProvider().getConnection().then((conn) async {
    print('inside del');

    await conn.query('Delete from flutterdb.projects where project_id=22');

    conn.close();

  }).onError((error, stackTrace) {

    print(error);

    return null;

  });

} 




  void increment() => count.value++;
}
