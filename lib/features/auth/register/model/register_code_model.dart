class RegisterCodeRequestModel {
  String? email;
  String? departmentId;

  RegisterCodeRequestModel({this.email, this.departmentId});

  RegisterCodeRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['department_id'] = departmentId;
    return data;
  }
}
