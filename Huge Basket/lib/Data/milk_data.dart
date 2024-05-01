import 'package:task_27_03/Cutom/notifier/count_notifier.dart';

class Milk {
  final String imgUrl;
  final String price;
  final String mg;
  final String subtitle;
  final String category;
  late final CountNotifier count;

  Milk(
      {required this.imgUrl,
      required this.price,
      required this.mg,
      required this.subtitle,
      required this.category,
      required this.count});
}

List<Milk> milkData = [
  Milk(
    imgUrl: 'assets/images/milk-shake.png',
    price: '1',
    mg: '1 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Milk',
    count: CountNotifier(0),
  ),
  Milk(
    imgUrl: 'assets/images/milk-shake.png',
    price: '2',
    mg: '2 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Milk',
    count: CountNotifier(0),
  ),
  Milk(
    imgUrl: 'assets/images/milk-shake.png',
    price: '3',
    mg: '3 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Milk',
    count: CountNotifier(0),
  ),
  Milk(
    imgUrl: 'assets/images/milk-shake.png',
    price: '4',
    mg: '4 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Milk',
    count: CountNotifier(0),
  ),
  Milk(
    imgUrl: 'assets/images/milk-shake.png',
    price: '5',
    mg: '5 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Milk',
    count: CountNotifier(0),
  ),
];
