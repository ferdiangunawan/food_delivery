part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int? id;
  final String? picturePath;
  final String? name;
  final String? description;
  final String? ingredients;
  final int? price;
  final double? rate;
  final List<FoodType>? types;
  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate,
      this.types = const []});

  factory Food.fromJson(Map<String, dynamic> data) {
    return Food(
        id: data['id'],
        picturePath: data['picturePath'],
        name: data['name'],
        description: data['description'],
        ingredients: data['ingredients'],
        price: data['price'],
        rate: (data['rate'] as num).toDouble(),
        types: data['types'].toString().split(',').map((e) {
          switch (e) {
            case 'recommended':
              return FoodType.recommended;
            case 'popular':
              return FoodType.popular;
            default:
              return FoodType.new_food;
          }
        }).toList());
  }

  @override
  List<Object> get props => [
        id!,
        picturePath!,
        name!,
        description!,
        ingredients!,
        price!,
        rate!,
      ];
}

List<Food> dummyFoods = [
  Food(
      id: 1,
      picturePath:
          'https://www.rukita.co/stories/wp-content/uploads/2020/02/byurger.jpg',
      name: 'Burger enak',
      description: 'Burger salah satu hidangan western yang sudah nggak asing lagi buat lidah orang Indonesia. Terdiri atas patty daging yang dipanggang, sayuran segar, keju yang lumer, dan diapit roti gurih. Kelezatan makanan yang satu ini memang sulit ditolak.',
      ingredients: 'Kambing, sapi, roti, gandum, bawang dll',
      price: 15000,
      rate: 4.5,
      types: [FoodType.new_food, FoodType.popular, FoodType.recommended]),
  Food(
      id: 2,
      picturePath:
          'https://selerasa.com/wp-content/uploads/2015/07/images_mancanegara_Resep_Kebab_00.jpg',
      name: 'Kebab Enak',
      description: 'Burger salah satu hidangan western yang sudah nggak asing lagi buat lidah orang Indonesia. Terdiri atas patty daging yang dipanggang, sayuran segar, keju yang lumer, dan diapit roti gurih. Kelezatan makanan yang satu ini memang sulit ditolak.',
      ingredients: 'Kambing, sapi, roti, gandum, bawang dll',
      price: 20000,
      rate: 3,
      types: [FoodType.new_food, FoodType.recommended]),
  Food(
      id: 3,
      picturePath:
          'https://selerasa.com/wp-content/uploads/2017/11/images_martabakmanisklasik.jpg',
      name: 'Martabak enak',
      description: 'Burger salah satu hidangan western yang sudah nggak asing lagi buat lidah orang Indonesia. Terdiri atas patty daging yang dipanggang, sayuran segar, keju yang lumer, dan diapit roti gurih. Kelezatan makanan yang satu ini memang sulit ditolak.',
      ingredients: 'Kambing, sapi, roti, gandum, bawang dll',
      price: 40000,
      rate: 5,
      types: [FoodType.new_food, FoodType.popular]),
  Food(
      id: 4,
      picturePath:
          'https://www.rukita.co/stories/wp-content/uploads/2020/02/byurger.jpg',
      name: 'Burger enak',
      description: 'Burger salah satu hidangan western yang sudah nggak asing lagi buat lidah orang Indonesia. Terdiri atas patty daging yang dipanggang, sayuran segar, keju yang lumer, dan diapit roti gurih. Kelezatan makanan yang satu ini memang sulit ditolak.',
      ingredients: 'Kambing, sapi, roti, gandum, bawang dll',
      price: 15000,
      rate: 4.5,
      types: [FoodType.popular, FoodType.recommended]),
  Food(
      id: 5,
      picturePath:
          'https://selerasa.com/wp-content/uploads/2015/07/images_mancanegara_Resep_Kebab_00.jpg',
      name: 'Kebab Enak',
      description: 'Burger salah satu hidangan western yang sudah nggak asing lagi buat lidah orang Indonesia. Terdiri atas patty daging yang dipanggang, sayuran segar, keju yang lumer, dan diapit roti gurih. Kelezatan makanan yang satu ini memang sulit ditolak.',
      ingredients: 'Kambing, sapi, roti, gandum, bawang dll',
      price: 20000,
      rate: 3,
      types: [FoodType.new_food]),
  Food(
    id: 6,
    picturePath:
        'https://selerasa.com/wp-content/uploads/2017/11/images_martabakmanisklasik.jpg',
    name: 'Martabak enak',
    description:
        'Burger salah satu hidangan western yang sudah nggak asing lagi buat lidah orang Indonesia. Terdiri atas patty daging yang dipanggang, sayuran segar, keju yang lumer, dan diapit roti gurih. Kelezatan makanan yang satu ini memang sulit ditolak.',
    ingredients: 'Kambing, sapi, roti, gandum, bawang dll',
    price: 40000,
    rate: 5,
  ),
  Food(
      id: 7,
      picturePath:
          'https://selerasa.com/wp-content/uploads/2017/11/images_martabakmanisklasik.jpg',
      name: 'Martabak enak',
      description: 'Burger salah satu hidangan western yang sudah nggak asing lagi buat lidah orang Indonesia. Terdiri atas patty daging yang dipanggang, sayuran segar, keju yang lumer, dan diapit roti gurih. Kelezatan makanan yang satu ini memang sulit ditolak.',
      ingredients: 'Kambing, sapi, roti, gandum, bawang dll',
      price: 40000,
      rate: 5,
      types: [FoodType.recommended]),
  Food(
    id: 8,
    picturePath:
        'https://selerasa.com/wp-content/uploads/2017/11/images_martabakmanisklasik.jpg',
    name: 'Martabak lumayan',
    description:
        'Burger salah satu hidangan western yang sudah nggak asing lagi buat lidah orang Indonesia. Terdiri atas patty daging yang dipanggang, sayuran segar, keju yang lumer, dan diapit roti gurih. Kelezatan makanan yang satu ini memang sulit ditolak.',
    ingredients: 'Kambing, sapi, roti, gandum, bawang dll',
    price: 40000,
    rate: 5,
  ),
];
