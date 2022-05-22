class Plant {
  String name;
  String type;
  String imageUrl;
  String description;
  String slogans;
  double humidity;
  double height;
  double price;
  int itemCount;

  Plant({
    required this.slogans,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.description,
    required this.humidity,
    required this.height,
    required this.price,
    this.itemCount = 0,
  });
}
