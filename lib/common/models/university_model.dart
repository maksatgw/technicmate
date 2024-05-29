class University {
  String? universityId;
  String? title;
  int? countryId;
  int? cityId;
  String? studentMail;
  bool? isActive;
  String? updatedAt;
  String? createdAt;

  University(
      {this.universityId,
      this.title,
      this.countryId,
      this.cityId,
      this.studentMail,
      this.isActive,
      this.updatedAt,
      this.createdAt});

  University.fromJson(Map<String, dynamic> json) {
    universityId = json['university_id'];
    title = json['title'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    studentMail = json['student_mail'];
    isActive = json['is_active'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['university_id'] = universityId;
    data['title'] = title;
    data['country_id'] = countryId;
    data['city_id'] = cityId;
    data['student_mail'] = studentMail;
    data['is_active'] = isActive;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
