
class TravelPackage {
  int? id;
  String title;
  String description;
  double price;
  String destination;
  String country;
  String city;
  String type;
  String image;

  TravelPackage({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.destination,
    required this.country,
    required this.city,
    required this.type,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price.toString(),
      'destination': destination,
      'country': country,
      'city': city,
      'type': type,
      'image': image,
    };
  }

  factory TravelPackage.fromMap(Map<String, dynamic> map) {
    return TravelPackage(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: double.tryParse(map['price'].toString()) ?? 0.0,
      destination: map['destination'],
      country: map['country'],
      city: map['city'],
      type: map['type'],
      image: map['image'],
    );
  }
}
