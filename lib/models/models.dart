class CategoryModel {
  final String title;
  final String imageUrl;

  CategoryModel(
    this.title,
    this.imageUrl,
  );
}

class MostPopular {
  final String title;
  final String location;
  final String imageUrl;

  MostPopular(this.title, this.location, this.imageUrl);
}

class Trip {
  final String title;
  final int price;
  final String duration;
  final String featureImgUrl;
  final String status;
  final List<String> tripImages;
  final String description;
  final List<String> itinerary;
  final int cities;
  final String tripType;
  final List<String> included;
  final List<String> excluded;
  Trip({
    required this.included,
    required this.excluded,
    required this.tripType,
    required this.cities,
    required this.itinerary,
    required this.description,
    required this.tripImages,
    required this.status,
    required this.title,
    required this.price,
    required this.duration,
    required this.featureImgUrl,
  });
}

class Category {
  final String id;
  final String title;
  final String imageUrl;
  Category({required this.id, required this.title, required this.imageUrl});
}
