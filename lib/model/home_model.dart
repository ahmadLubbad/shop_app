class HomeModel
{
  bool status;
  HomeDataModel data;

  HomeModel.fromJason(Map<String,dynamic>json)
  {
    status=json['status'];
    data=HomeDataModel.fromJason(json['data']);
  }
}

// response[data][banners][index][image];

class HomeDataModel
{

  List<BannerModel> banners=[];
  List<ProductModel> products=[];

  HomeDataModel.fromJason(Map<String,dynamic>json)
  {
    json['banners'].forEach((element)
    {
      banners.add(BannerModel.fromJason(element));
    });

    json['products'].forEach((element)
    {
      products.add(ProductModel.fromJason(element));
    });
  }

}

class BannerModel
{
  int id;
  String image;

  BannerModel.fromJason(Map<String,dynamic>json)
  {
    id = json['id'];
    image = json['image'];
  }

}

class ProductModel
{

  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  bool inFavorites;
  bool inCart;


  ProductModel.fromJason(Map<String,dynamic>json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

}