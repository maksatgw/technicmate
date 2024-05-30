class RegisterModel {
  String? email;
  String? firstname;
  String? lastname;
  String? birthDate;
  int? gender;
  String? departmentId;
  String? encryptedPassword;
  String? completeCode;

  RegisterModel(
      {this.email,
      this.firstname,
      this.lastname,
      this.birthDate,
      this.gender,
      this.departmentId,
      this.encryptedPassword,
      this.completeCode});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    departmentId = json['department_id'];
    encryptedPassword = json['encrypted_password'];
    completeCode = json['complete_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    data['department_id'] = departmentId;
    data['encrypted_password'] = encryptedPassword;
    data['complete_code'] = completeCode;
    return data;
  }
}
