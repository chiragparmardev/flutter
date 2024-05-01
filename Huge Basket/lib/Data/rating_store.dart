class RatingStore {
  final String name;
  final int rating;
  final String profilePic;
  final String time;

  RatingStore({
    required this.name,
    required this.rating,
    required this.profilePic,
    required this.time,
  });
}

final List<RatingStore> ratingStoreData = [
  RatingStore(
    name: 'Michail trot',
    rating: 5,
    profilePic:
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
    time: '2 min ago',
  ),
  RatingStore(
    name: 'Rojar marei',
    rating: 3,
    profilePic:
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
    time: '2 min ago',
  ),
  RatingStore(
    name: 'Jack raben',
    rating: 4,
    profilePic:
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
    time: '2 min ago',
  ),
  RatingStore(
    name: 'Rojar marei',
    rating: 2,
    profilePic:
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
    time: '2 min ago',
  ),
];
