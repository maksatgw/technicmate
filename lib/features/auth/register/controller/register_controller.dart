import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicmate/features/auth/register/model/register_code_model.dart';
import 'package:technicmate/features/auth/register/model/register_code_response_model.dart';
import 'package:technicmate/features/auth/register/model/register_departments_model.dart';
import 'package:technicmate/features/auth/register/model/register_model.dart';
import 'package:technicmate/features/auth/register/service/register_service.dart';

class RegisterController extends GetxController {
  String? universityId;
  String? email;

  var departId = "".obs;
  var selectedGender = 0.obs;
  var departName = "".obs;

  final RegisterService service = RegisterService();

  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerSurnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var registerDepartmentModel = RegisterDepartmentModel().obs;
  var codeModel = RegisterCodeReturnModel().obs;
  RegisterCodeRequestModel req = RegisterCodeRequestModel();
  RegisterModel registerModel = RegisterModel();
  var selectedDate = DateTime(2003).obs;

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1980),
      lastDate: DateTime(2005),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  Future<void> registerUser() async {
    try {
      registerModel.birthDate = selectedDate.value.toString();
      registerModel.firstname = registerNameController.text;
      registerModel.lastname = registerSurnameController.text;
      registerModel.gender = selectedGender.value + 1;
      registerModel.departmentId = departId.value;
      registerModel.email = email;
      registerModel.encryptedPassword = passwordController.text;
      registerModel.completeCode = "123456";
      var response = await service.registerPostModel(registerModel);
      if (response != null) {
        codeModel.value = response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> registerCodePost() async {
    try {
      req.departmentId = departId.value;
      req.email = email;
      var response = await service.registerCodePost(req);
      if (response != null) {
        codeModel.value = response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getDepatments(String? uniId) async {
    try {
      var response = await service.getDepartments(uniId);
      if (response != null) {
        registerDepartmentModel.value = response;
      }
    } catch (e) {
      print(e);
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Şifre boş olamaz';
    } else if (value.length < 6) {
      return 'Şifre en az 6 karakter olmalı';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Şifre en az bir sayısal karakter içermeli';
    }
    return null;
  }
}
