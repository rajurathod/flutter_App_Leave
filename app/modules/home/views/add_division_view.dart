import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj3/app/modules/home/controllers/home_controller.dart';

class AddDivisionView extends GetView {
  final home_controller = Get.put(HomeController());
  TextEditingController division_id_ctl = TextEditingController();
  TextEditingController division_name_ctl = TextEditingController();
  TextEditingController project_id_ctl = TextEditingController();
  TextEditingController project_name_ctl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddDivisionView'),
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
                      controller: division_id_ctl,
                      decoration: const InputDecoration(
                        label: Center(child: Text('Division_ID')),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: division_name_ctl,
                      decoration: const InputDecoration(
                        label: Center(child: Text('Division_NAME')),
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
                    child: DropdownButton(
                      hint: const Text('project id'),
                      onChanged: (newValue) {
                        home_controller.selectedDrowpdown = newValue.toString();
                        home_controller.update();
                      },
                      value: home_controller.selectedDrowpdown,
                      items: [
                        for (var data in home_controller.dropdownText)
                          DropdownMenuItem(
                            value: data,
                            child: Text(data),
                          )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: project_name_ctl,
                      decoration: const InputDecoration(
                        label: Center(child: Text('PROJECT_name')),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              FlatButton(
                color: Colors.blue,
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Add Division',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
