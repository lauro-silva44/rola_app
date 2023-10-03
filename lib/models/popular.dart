class Popular {
  Popular(
      {required this.name,
      required this.imagePath,
      required this.entryPrice,
      required this.sport,
      required this.isFavorite,
      required this.distance,
      required this.rate});
  final String imagePath;
  final String name;
  final double entryPrice;
  final String sport;
  final double distance;
  final double rate;
  final bool isFavorite;
}
