class Department {
  String? departmentId;
  String? universityId;
  String? title;
  int? degree;
  bool? isActive;
  String? updatedAt;
  String? createdAt;

  Department({this.departmentId, this.universityId, this.title, this.degree, this.isActive, this.updatedAt, this.createdAt});

  Department.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    universityId = json['university_id'];
    title = json['title'];
    degree = json['degree'];
    isActive = json['is_active'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_id'] = this.departmentId;
    data['university_id'] = this.universityId;
    data['title'] = this.title;
    data['degree'] = this.degree;
    data['is_active'] = this.isActive;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
