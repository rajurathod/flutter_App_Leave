import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj3/app/modules/home/controllers/home_controller.dart';

class ProjectListView extends GetView {
  //final HomeController = Get.get(Home_Controller());
   final Home_controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectListView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ListTile(
                  title: const Text('Project name'),
                  tileColor: Colors.red,
                  trailing: IconButton(onPressed:Home_controller.DisplayProjectsList, icon: const Icon(Icons.edit)),
                  horizontalTitleGap: 10,
                  // trailing: Row(children: [Expanded(child: Icon(Icons.edit)),
                  // Expanded(child: Icon(Icons.delete))],),
                ),
                const Divider(height: 5,)
              ],
            ),
          ) ;
        },
      ),
    );
  }
}
