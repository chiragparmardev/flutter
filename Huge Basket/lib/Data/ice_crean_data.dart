import 'package:task_27_03/Cutom/notifier/count_notifier.dart';

class IceCream {
  final String imgUrl;
  final String price;
  final String mg;
  final String subtitle;
  final String category;
  late final CountNotifier count;

  IceCream(
      {required this.imgUrl,
      required this.price,
      required this.mg,
      required this.subtitle,
      required this.category,
      required this.count});
}

List<IceCream> iceCreamData = [
  IceCream(
    imgUrl: 'assets/images/ice-cream1.png',
    price: '6',
    mg: '6 mg',
    subtitle: 'Lactaid Fat Free Pure ice-cream',
    category: 'Ice-cream',
    count: CountNotifier(0),
  ),
  IceCream(
    imgUrl: 'assets/images/ice-cream1.png',
    price: '7',
    mg: '7 mg',
    subtitle: 'Lactaid Fat Free Pure ice-cream',
    category: 'Ice-cream',
    count: CountNotifier(0),
  ),
  IceCream(
    imgUrl: 'assets/images/ice-cream1.png',
    price: '8',
    mg: '8 mg',
    subtitle: 'Lactaid Fat Free Pure ice-cream',
    category: 'Ice-cream',
    count: CountNotifier(0),
  ),
];
