class JobseekerModel {
  final int id;
  final String name;
  final int contactNumber;
  final int nric;
  final String email;

  const JobseekerModel({
    required this.id,
    required this.name,
    required this.contactNumber,
    required this.nric,
    required this.email,
  });

  factory JobseekerModel.fromJson(Map<String, dynamic> json) => JobseekerModel(
    id : json['id'],
    name : json['name'],
    contactNumber : json['contact_number'],
    nric : json['nric'],
    email : json['email'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "contact_number": contactNumber,
    "nric": nric,
    "email": email,
  };
}
