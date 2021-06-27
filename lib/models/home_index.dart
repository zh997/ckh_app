HomeIndexModel HomeIndexModelFromJson(json) => HomeIndexModel.fromJson(json);


class HomeIndexModel {
  String videroUrl;
  List<SliderList> sliderList;

  HomeIndexModel({this.videroUrl, this.sliderList});

  HomeIndexModel.fromJson(Map<String, dynamic> json) {
    videroUrl = json['videro_url'];
    if (json['slider_list'] != null) {
      sliderList = new List<SliderList>();
      json['slider_list'].forEach((v) {
        sliderList.add(new SliderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videro_url'] = this.videroUrl;
    if (this.sliderList != null) {
      data['slider_list'] = this.sliderList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SliderList {
  int id;
  String title;
  String cover;
  String url;
  int sort;

  SliderList({this.id, this.title, this.cover, this.url, this.sort});

  SliderList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    cover = json['cover'];
    url = json['url'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['url'] = this.url;
    data['sort'] = this.sort;
    return data;
  }
}
