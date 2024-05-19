class University {
  String? universityId;
  String? title;
  int? countryId;
  int? cityId;
  String? studentMail;
  bool? isActive;
  String? updatedAt;
  String? createdAt;

  University({this.universityId, this.title, this.countryId, this.cityId, this.studentMail, this.isActive, this.updatedAt, this.createdAt});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['university_id'] = this.universityId;
    data['title'] = this.title;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['student_mail'] = this.studentMail;
    data['is_active'] = this.isActive;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
