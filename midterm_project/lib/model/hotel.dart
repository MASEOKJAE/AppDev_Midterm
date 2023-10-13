class Hotel {
  const Hotel({
    required this.id,
    required this.star,
    required this.name,
    required this.location,
    required this.number,
    required this.intro,
    required this.picture
  });

  final int id;
  final int star;
  final String name;
  final String location;
  final String number;
  final String intro;
  final String picture;

  @override
  String toString() => "$name (id=$id)";
}