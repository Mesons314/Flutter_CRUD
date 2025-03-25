class User{
  final int? id;
  final String firstName;
  final String lastName;
  final String DOB;
  final int? age;
  final String location;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.DOB,
    required this.age,
    required this.location
});
}