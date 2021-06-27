CompanyListModel CompanyListModelFromJson(json) => CompanyListModel.fromJson(json);

class CompanyListModel {
  int id;
  String title;
  String contentOne;
  String contentTwo;
  int sort;
  int status;
  List<String> imgArr;

  CompanyListModel(
      {this.id,
        this.title,
        this.contentOne,
        this.contentTwo,
        this.sort,
        this.status,
        this.imgArr});

  CompanyListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    contentOne = json['content_one'];
    contentTwo = json['content_two'];
    sort = json['sort'];
    status = json['status'];
    imgArr = json['img_arr'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content_one'] = this.contentOne;
    data['content_two'] = this.contentTwo;
    data['sort'] = this.sort;
    data['status'] = this.status;
    data['img_arr'] = this.imgArr;
    return data;
  }
}
