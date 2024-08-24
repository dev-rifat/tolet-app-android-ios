import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_let_mobile_app/common/widgets/warning_message.dart';
import '../../../../common/widgets/success_message.dart';
import '../../../../init_ app.dart';
import '../hive/hive_object.dart';

class WishlistController extends GetxController {
  late Box<WishlistItem> wishlistBox;

  @override
  void onInit() {
    super.onInit();
    wishlistBox = Hive.box<WishlistItem>(wishListTableKey);
  }

  void addItem({
    required int id,
    required String name,
    required String rent,
    required String bedroom,
    required String img,
  }) {
    try {
      // Check if an item with the same id already exists
      final exists = wishlistBox.values.any((item) => item.id == id);
      if (exists) {
        print('Item with id $id already exists in the wishlist');
        showWarningMessage(message: "Already exists in the wishlist");
        return;
      }

      final item = WishlistItem(id: id, name: name, rent: rent,bedroom:bedroom ,img: img);
      wishlistBox.add(item);
      update(); // Notify listeners
      print('Item added: ${item.name}');
      showSuccessMessage(message: "Wishlist Added Successfully");
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
        showSuccessMessage(message: "Wishlist Remove Successfully");

      } else {
        print('Item with id $id not found');
      }
    } catch (e) {
      print('Error deleting item with id $id: $e');
    }
  }
}
