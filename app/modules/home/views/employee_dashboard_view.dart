import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proj3/app/modules/home/controllers/home_controller.dart';
import 'package:proj3/app/modules/home/views/Division_Dashboard.dart';
import 'package:proj3/app/modules/home/views/project_master_view.dart';

class EmployeeDashboardView extends GetView {
  //final home_controller1 =Get.to(HomeController());
  //const EmployeeDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee-Dashboard'),
        centerTitle: true,
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: const [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'FName:RAJU',
                  style: TextStyle(
                      backgroundColor: Colors.blue,
                      fontSize: 20,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'LName:RATHOD',
                  style: TextStyle(
                      backgroundColor: Colors.blue,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'KADRA HYDRO PROJECT',
                    style: TextStyle(
                        backgroundColor: Colors.blue,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Text(
                    'SUPERINTENDING ELECTRICAL',
                    style: TextStyle(
                        backgroundColor: Colors.blue,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Phone:9986395108',
                    style: TextStyle(
                        backgroundColor: Colors.blue,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Text(
                    'Email:raju@gmail.com',
                    style: TextStyle(
                        backgroundColor: Colors.blue,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
           
            Row(
              children: [
                Expanded(
                  child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(10),
                      child: FlatButton(
                        onPressed: () {
                          Get.to(DivisionDashboardView ());
                        },
                        child: const Text(
                          'Division',
                          style: TextStyle(fontSize: 24),
                        ),
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(10),
                    child: FlatButton(
                      onPressed: () {
                        Get.to(ProjectMasterView() );
                      },
                      child: const Text(
                        'Project',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
