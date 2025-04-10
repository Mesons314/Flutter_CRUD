class User{
  final int? id;
  final String firstName;
  final String lastName;
  final String dob;
  final String gender;
  final String age;
  final String location;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.age,
    required this.location
});


  Map<String,dynamic> toJson(){
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'dob': dob,
      'location': location,
      'age': age
    };
  }
}