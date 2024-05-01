class Review {
  final String name;
  final int rating;
  final String profilePic;
  final String time;

  Review({
    required this.name,
    required this.rating,
    required this.profilePic,
    required this.time,
  });
}

final List<Review> reviews = [
  Review(
    name: 'Michail trot',
    rating: 5,
    profilePic:
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
    time: '2 min ago',
  ),
  Review(
    name: 'Rojar marei',
    rating: 3,
    profilePic:
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
    time: '2 min ago',
  ),
  Review(
    name: 'Jack raben',
    rating: 4,
    profilePic:
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
    time: '2 min ago',
  ),
  Review(
    name: 'Rojar marei',
    rating: 2,
    profilePic:
        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
    time: '2 min ago',
  ),
];
