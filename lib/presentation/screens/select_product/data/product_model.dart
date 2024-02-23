class ProductModel {
  ProductModel({
    this.pic = 'asset/images/ic_prod_5@3x.png',
    required this.name,
    required this.type,
    required this.weight,
    required this.price,
  });

  final String pic;
  final String name;
  final String type;
  final String weight;
  final double price;
}
