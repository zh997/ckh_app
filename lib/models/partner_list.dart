PartnerListModel PartnerListModelFromJson(json) => PartnerListModel.fromJson(json);

class PartnerListModel {
  int id;
  String cover;
  int status;
  int sort;

  PartnerListModel({this.id, this.cover, this.status, this.sort});

  PartnerListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    status = json['status'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cover'] = this.cover;
    data['status'] = this.status;
    data['sort'] = this.sort;
    return data;
  }
}