SetteldCompanyListModel SetteldCompanyListModelFromJson(json) => SetteldCompanyListModel.fromJson(json);

class SetteldCompanyListModel {
  int id;
  String title;

  SetteldCompanyListModel({this.id, this.title});

  SetteldCompanyListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}