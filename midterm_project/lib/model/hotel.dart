class Hotel {
  const Hotel({
    required this.id,
    required this.name,
    required this.location,
    required this.number,
    required this.intro
  });

  final int id;
  final String name;
  final String location;
  final String number;
  final String intro;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}