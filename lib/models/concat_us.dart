ConcatUsModel ConcatUsModelFromJson(json) => ConcatUsModel.fromJson(json);

class ConcatUsModel {
  String companyTip;
  String phone;
  String email;
  String addres;

  ConcatUsModel({this.companyTip, this.phone, this.email, this.addres});

  ConcatUsModel.fromJson(Map<String, dynamic> json) {
    companyTip = json['company_tip'];
    phone = json['phone'];
    email = json['email'];
    addres = json['addres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_tip'] = this.companyTip;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['addres'] = this.addres;
    return data;
  }
}