HonnerListModel HonnerListModelFromJson(json) => HonnerListModel.fromJson(json);

class HonnerListModel {
  int id;
  String cover;
  String title;
  int sort;
  int status;

  HonnerListModel({this.id, this.cover, this.title, this.sort, this.status});

  HonnerListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    title = json['title'];
    sort = json['sort'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cover'] = this.cover;
    data['title'] = this.title;
    data['sort'] = this.sort;
    data['status'] = this.status;
    return data;
  }
}