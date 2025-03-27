class User{
  final int? id;
  final String firstName;
  final String lastName;
  final String DOB;
  final String gender;
  final int? age;
  final String location;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.DOB,
    required this.gender,
    required this.age,
    required this.location
});


  Map<String,dynamic> toJson(){
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'DOB': DOB,
      'location': location,
      'age': age
    };
  }
}