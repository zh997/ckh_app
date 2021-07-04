NewDetailModel NewDetailModelFromJson(json) => NewDetailModel.fromJson(json);


class NewDetailModel {
  int id;
  int cid;
  String title;
  String cover;
  int picture2;
  int picture3;
  String abstract;
  String content;
  String updateTime;
  int sort;
  int status;
  List<String> imgArr;

  NewDetailModel(
      {this.id,
        this.cid,
        this.title,
        this.cover,
        this.picture2,
        this.picture3,
        this.abstract,
        this.content,
        this.updateTime,
        this.sort,
        this.status,
        this.imgArr});

  NewDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cid = json['cid'];
    title = json['title'];
    cover = json['cover'];
    picture2 = json['picture2'];
    picture3 = json['picture3'];
    abstract = json['abstract'];
    content = json['content'];
    updateTime = json['update_time'];
    sort = json['sort'];
    status = json['status'];
    imgArr = json['img_arr'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cid'] = this.cid;
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['picture2'] = this.picture2;
    data['picture3'] = this.picture3;
    data['abstract'] = this.abstract;
    data['content'] = this.content;
    data['update_time'] = this.updateTime;
    data['sort'] = this.sort;
    data['status'] = this.status;
    data['img_arr'] = this.imgArr;
    return data;
  }
}
