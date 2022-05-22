class Plant {
  String name;
  String type;
  String imageUrl;
  String description;
  String slogans;
  double humidity;
  double height;
  double price;

  Plant(
      {required this.slogans,
      required this.name,
      required this.type,
      required this.imageUrl,
      required this.description,
      required this.humidity,
      required this.height,
      required this.price});
}
