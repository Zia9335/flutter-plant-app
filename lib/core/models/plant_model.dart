class Plant {
  final String name;
  final String type;
  final String imageUrl;
  final String description;
  final String slogans;
  final double humidity;
  final double height;
  final double price;
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
  
  Plant.fromJson(json){
    
    this.slogans = json['slogans'];
    this.name = json['name'];
    this.type = json['type'];
    this.imgUrl = json['imgUrl'];
    this.description = json['description'];
    this.humidity = json['humidity'];
    this.height = json['height'];
    
  }
  
  toJson(){
    return {
    'slogans': this.slogans,
      'name': this.name,
      'type': this.type,
      .....
        ......
        ........
    
    }
  }
    
}
  
  
