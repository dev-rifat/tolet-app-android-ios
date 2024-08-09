import 'package:hive/hive.dart';
part 'hive_object.g.dart';


@HiveType(typeId: 0)
class WishlistItem extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String rent;

  @HiveField(3)
  final String bedroom;
  @HiveField(4)
  final String img;

  WishlistItem({required this.id, required this.name, required this.rent,required this.bedroom,required this.img});
}
