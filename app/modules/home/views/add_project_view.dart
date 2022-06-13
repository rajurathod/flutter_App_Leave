import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj3/app/modules/home/controllers/home_controller.dart';

class AddProjectView extends GetView {
   final Home_controller = Get.put(HomeController());
  TextEditingController Project_id_ctl = TextEditingController();
  TextEditingController Project_name_ctl = TextEditingController();
  TextEditingController Project_latitude_ctl = TextEditingController();
  TextEditingController Project_longitude_ctl = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProjectView'),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: Project_id_ctl,
                      decoration: const InputDecoration(
                          label: Center(child: Text('PROJECT_ID')),
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10))
                              ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: Project_name_ctl,
                      decoration: const InputDecoration(
                          label: Center(child: Text('PROJECT_NAME')),
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10))
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: Project_longitude_ctl,
                      decoration: const InputDecoration(
                          label: Center(child: Text('PROJECT_LONGITUDE')),
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10))
                              ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: Project_latitude_ctl,
                      decoration: const InputDecoration(
                          label: Center(child: Text('PROJECT_LATITUDE')),
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10))
                              ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  Home_controller.Add_Project(
                   // int.parse(Project_id_ctl.text),
                    Project_name_ctl.text,
                    Project_latitude_ctl.text,
                    Project_longitude_ctl.text,
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Add Project',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              // FlatButton(
              //   color: Colors.blue,
              //   onPressed: (){
              //   Get.to('');
              // }, child: Text('List Of Projects', style: TextStyle(fontSize: 28,color: Colors.yellowAccent),),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
