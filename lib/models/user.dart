part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturePath;
  static String? token;
  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });

  
          
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      address: map['address'],
      houseNumber: map['houseNumber'],
      phoneNumber: map['phoneNumber'],
      city: map['city'],
      picturePath: map['profile_photo_url'],
    );
  }

  User copyWith(
          {int? id,
          String? name,
          String? email,
          String? address,
          String? houseNumber,
          String? phoneNumber,
          String? city,
          String? picturePath}) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          address: address ?? this.address,
          houseNumber: houseNumber ?? this.houseNumber,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          city: city ?? this.city,
          picturePath: picturePath ?? this.picturePath);

  @override
  List<Object> get props {
    return [
      id!,
      name!,
      email!,
      address!,
      houseNumber!,
      phoneNumber!,
      city!,
      picturePath!,
    ];
  }
}

User dummyUsers = User(
    id: 1,
    name: 'Ferdian Gunawan',
    email: 'fgdev.studio@gmail.com',
    address: 'Bangka Belitung',
    phoneNumber: '088808978500',
    houseNumber: '10',
    city: 'Jakarta',
    picturePath:
        'https://pbs.twimg.com/profile_images/1360921816542273537/CCkmfi12_400x400.jpg');
