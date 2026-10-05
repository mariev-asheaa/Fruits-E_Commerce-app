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
      inActiveImage: Assets.icons.homeOutline.path,
      name: 'الرئيسية'),
  BottomNavigationBarEntity(
      activeImage: Assets.icons.products.path,
      inActiveImage: Assets.icons.productsOutline.path,
      name: 'المنتجات'),
  BottomNavigationBarEntity(
      activeImage: Assets.icons.shoppingCart.path,
      inActiveImage: Assets.icons.shoppingCartOutline.path,
      name: 'سلة التسوق'),
  BottomNavigationBarEntity(
      activeImage: Assets.icons.user.path,
      inActiveImage: Assets.icons.userOutline.path,
      name: 'حسابي'),
];