class Plant {
  final String name;
  final String type;
  final String imageUrl;
  final String description;
  final String slogans;
  final num humidity;
  final num height;
  final num price;
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
    required this.itemCount,
  });

// fromjson function
  factory Plant.fromJson(json) {
    return Plant(
      name: json['name'] as String,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      slogans: json['slogans'] as String,
      humidity: json['humidity'] as num,
      height: json['height'] as num,
      price: json['price'] as num,
      itemCount: json['itemCount'] as int,
    );
  }

  // tojson function
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['slogans'] = this.slogans;
    data['humidity'] = this.humidity;
    data['height'] = this.height;
    data['price'] = this.price;
    data['itemCount'] = this.itemCount;
    return data;
  }

  // tojson function
  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': this.name,
  //     'type': this.type,
  //     'name': this.name,
  //     'imageUrl': this.imageUrl,
  //     'description': this.description,
  //     'slogans': this.slogans,
  //     'height': this.height,
  //     'humidity': this.humidity,
  //     'itemCount': this.itemCount,
  //   };
  // }
}
