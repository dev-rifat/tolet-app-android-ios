import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../hive/hive_object.dart';

class WishlistController extends GetxController {
  late Box<WishlistItem> wishlistBox;

  @override
  void onInit() {
    super.onInit();
    wishlistBox = Hive.box<WishlistItem>('wishlist');
  }

  void addItem({
    required int id,
    required String name,
    required String description,
  }) {
    try {
      // Check if an item with the same id already exists
      final exists = wishlistBox.values.any((item) => item.id == id);
      if (exists) {
        print('Item with id $id already exists in the wishlist');
        return;
      }

      final item = WishlistItem(id: id, name: name, description: description);
      wishlistBox.add(item);
      update(); // Notify listeners
      print('Item added: ${item.name}');
    } catch (e) {
      print('Error adding item: $e');
    }
  }

  void deleteItem(int id) {
    try {
      final index = wishlistBox.values.toList().indexWhere((item) => item.id == id);
      if (index != -1) {
        wishlistBox.deleteAt(index);
        update(); // Notify listeners
        print('Item deleted with id: $id');
      } else {
        print('Item with id $id not found');
      }
    } catch (e) {
      print('Error deleting item with id $id: $e');
    }
  }
}
