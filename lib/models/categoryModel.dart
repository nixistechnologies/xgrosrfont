class CategoryModel{
  String id;
  String name;
  String imgUrl;

  CategoryModel(this.id,this.name,this.imgUrl);
  CategoryModel.fromJson(Map<String,dynamic> json)
    :name = json["node"]["name"],
    imgUrl = json["node"]["image"],
    id = json["node"]["id"];

    Map<String,dynamic> toJson() =>{
      'name':name,
      'imgUrl':imgUrl
    };
}