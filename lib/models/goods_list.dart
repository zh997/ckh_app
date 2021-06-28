GoodsListModel GoodsListModelFromJson(json) => GoodsListModel.fromJson(json);

class GoodsListModel {
  int id;
  String goodsName;
  String goodsTitle;
  String goodsImg;
  String qrcodeImg;
  int status;
  int sort;
  dynamic price;

  GoodsListModel(
      {this.id,
        this.goodsName,
        this.goodsTitle,
        this.goodsImg,
        this.qrcodeImg,
        this.status,
        this.sort,
        this.price});

  GoodsListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsName = json['goods_name'];
    goodsTitle = json['goods_title'];
    goodsImg = json['goods_img'];
    qrcodeImg = json['qrcode_img'];
    status = json['status'];
    sort = json['sort'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goods_name'] = this.goodsName;
    data['goods_title'] = this.goodsTitle;
    data['goods_img'] = this.goodsImg;
    data['qrcode_img'] = this.qrcodeImg;
    data['status'] = this.status;
    data['sort'] = this.sort;
    data['price'] = this.price;
    return data;
  }
}