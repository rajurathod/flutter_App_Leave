
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj3/app/modules/home/controllers/home_controller.dart';
import 'package:proj3/app/modules/home/views/add_project_view.dart';

class ProjectMasterView extends GetView {
  final Home_controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(AddProjectView());
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('ProjectMasterView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FlatButton(
              onPressed: Home_controller.DisplayProjectsList,
              child: const Text('List of Project',style: TextStyle(color: Colors.red,fontSize: 24),)),
          SizedBox(
            // color: Color.fromRGBO(255, 215, 64, 1),
             width: 400,
             height: 600,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: Home_controller.MyProjectList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Lat:${Home_controller
                            .MyProjectList[index].project_latitude}",style: const TextStyle(color: Colors.red),),
                            
                        Text("Long:${Home_controller
                            .MyProjectList[index].project_longitude}",style: const TextStyle(color: Colors.red),),

                          ],),
                          tileColor: Colors.grey[400],
                          leading: IconButton(onPressed: 
                            Home_controller.Delete_Project,
                           icon: const Icon(Icons.edit)),
                          trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete),),
                          title:Center(
                            child: Text(Home_controller
                              .MyProjectList[index].project_name
                              .toString(),style: const TextStyle(color: Colors.black),),
                          ), 


                        ),
                      ),
                      const Divider(
                        height: 10,
                        color: Colors.black,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
