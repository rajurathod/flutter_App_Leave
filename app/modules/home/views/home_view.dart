import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proj3/app/modules/home/views/employee_dashboard_view.dart';
import 'package:proj3/app/modules/home/views/Division_Dashboard.dart';
import 'package:proj3/app/modules/home/views/forgot_password_view.dart';
import 'package:proj3/app/modules/home/views/registration_form_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KPCL'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Karnataka Power Corporation Limited",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.number,
                //controller: emp_code_controller,
                onChanged: (emp_code_value) {},
                decoration: InputDecoration(
                  label: Text(
                    'Emp code',
                    //style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                //controller: lpgin_paswword_controller,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  label: Text(
                    'password',
                    textAlign: TextAlign.center,
                    //style:  TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              color: Colors.blue,
              //style: ButtonStyle(backgroundColor: MaterialStateProperty(Color)),

              onPressed: () {
                Get.to(EmployeeDashboardView());
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(130, 10, 130, 10),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(190, 0, 0, 0),
                child: FlatButton(
                  onPressed: () {
                    Get.to(ForgotPasswordView());
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(fontSize: 20),
                  ),
                )),

                SizedBox(height: 40,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Text(
                    'Dont have an Acoount ?',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 0,
                ),
                FlatButton(
                    onPressed: () {
                      Get.to(RegistrationFormView());
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
