class DepartmentModel {
  String? departmentId;
  String? universityId;
  String? title;
  int? degree;
  bool? isActive;
  String? updatedAt;
  String? createdAt;

  DepartmentModel(
      {this.departmentId,
      this.universityId,
      this.title,
      this.degree,
      this.isActive,
      this.updatedAt,
      this.createdAt});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    universityId = json['university_id'];
    title = json['title'];
    degree = json['degree'];
    isActive = json['is_active'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['department_id'] = departmentId;
    data['university_id'] = universityId;
    data['title'] = title;
    data['degree'] = degree;
    data['is_active'] = isActive;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
