import '../../../../generated/assets.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
        required this.inActiveImage,
        required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
      activeImage: Assets.icons.home.path,
      inActiveImage: Assets.icons.home1.path,
      name: 'الرئيسية'),
  BottomNavigationBarEntity(
      activeImage: Assets.icons.products.path,
      inActiveImage: Assets.icons.products1.path,
      name: 'المنتجات'),
  BottomNavigationBarEntity(
      activeImage: Assets.icons.shoppingCart.path,
      inActiveImage: Assets.icons.shoppingCart1.path,
      name: 'سلة التسوق'),
  BottomNavigationBarEntity(
      activeImage: Assets.icons.user.path,
      inActiveImage: Assets.icons.user1.path,
      name: 'حسابي'),
];