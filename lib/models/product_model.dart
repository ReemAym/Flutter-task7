// class ProductModel {
//   final int id;
//   final String title;
//   final String category;
//   final String price;
//   final String description;
//   final String image;
//   final RatingModel rating;

//   ProductModel({
//     required this.id,
//     required this.description,
//     required this.image,
//     required this.price,
//     required this.title,
//     required this.rating,
//     required this.category,
//   });

//   factory ProductModel.fromjson(jsonData) {
//     return ProductModel(
//       id: jsonData['id'],
//       category: jsonData['category'],
//       description: jsonData['description'],
//       image: jsonData['image'],
//       price: jsonData['price'].toString(),
//       title: jsonData['title'],
//       rating: RatingModel.fromjson(jsonData['rating']),
//     );
//   }
// }

// class RatingModel {
//   final double rate;
//   final int count;

//   RatingModel({
//     required this.count,
//     required this.rate,
//   });

//   factory RatingModel.fromjson(jsonData) {
//     return RatingModel(
//       count: jsonData['count'] ?? 0,
//       rate: (jsonData['rate'] is int) // Convert to double if it's int
//           ? (jsonData['rate'] as int).toDouble()
//           : jsonData['rate'],
//     );
//   }
// }
class ProductModel {
  final int id;
  final String title;
  final String category;
  final String price;
  final String description;
  final String image;
  final RatingModel? rating; // Make rating nullable

  ProductModel({
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.title,
    required this.category,
    this.rating, // rating can be null
  });

  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      category: jsonData['category'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: jsonData['price'].toString(),
      title: jsonData['title'],
      rating: jsonData['rating'] != null 
          ? RatingModel.fromjson(jsonData['rating']) 
          : null, // Handle null rating
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.count,
    required this.rate,
  });

  factory RatingModel.fromjson(jsonData) {
    return RatingModel(
      count: jsonData['count'] ?? 0,
      rate: (jsonData['rate'] is int)
          ? (jsonData['rate'] as int).toDouble()
          : jsonData['rate'] ?? 0.0, // Provide default value for rate
    );
  }
}
