import 'package:task_27_03/Cutom/notifier/count_notifier.dart';

class Snaks {
  final String imgUrl;
  final String price;
  final String mg;
  final String subtitle;
  final String category;
  late final CountNotifier count;

  Snaks(
      {required this.imgUrl,
      required this.price,
      required this.mg,
      required this.subtitle,
      required this.category,
      required this.count});
}

List<Snaks> snaksData = [
  Snaks(
    imgUrl: 'assets/images/fries.png',
    price: '1',
    mg: '20 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Snaks',
    count: CountNotifier(0),
  ),
  Snaks(
    imgUrl: 'assets/images/fries.png',
    price: '2',
    mg: '20 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Snaks',
    count: CountNotifier(0),
  ),
  Snaks(
    imgUrl: 'assets/images/fries.png',
    price: '3',
    mg: '20 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Snaks',
    count: CountNotifier(0),
  ),
  Snaks(
    imgUrl: 'assets/images/fries.png',
    price: '4',
    mg: '20 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Snaks',
    count: CountNotifier(0),
  ),
  Snaks(
    imgUrl: 'assets/images/fries.png',
    price: '5',
    mg: '20 mg',
    subtitle: 'Lactaid Fat Free Pure Milk',
    category: 'Snaks',
    count: CountNotifier(0),
  ),
];
