class UserModel{
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String city;
  final String state;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.state
  });

  factory UserModel.fromMap(Map<String, dynamic> response) {
    return UserModel(
        id: response['id'],
      name: response['name'],
      email: response['email'],
      phone: response['phone'],
      city: response['city'],
      state: response['state']
    );
  }
}