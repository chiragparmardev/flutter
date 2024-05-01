// ignore_for_file: avoid_print

class UserData {
  String name;
  int id;
  String course;
  UserData({required this.name, required this.id, required this.course});
  @override
  String toString() {
    return '"id": $id, \n "name": $name, \n "course": $course';
  }

  UserData copyWith({int? id, String? name, required String course}) {
    return UserData(name: name ?? this.name, id: id ?? this.id, course: course);
  }
}

void main() {
  final userdata1 = UserData(name: "Chirag", id: 10, course: "English");
  print("First User default Values");
  print("$userdata1");
  final userdata2 = userdata1.copyWith(course: "Maths");
  final userdata3 = userdata1.copyWith(course: "SVS");
  final userdata4 = userdata1.copyWith(id: 20, course: "Hindi");
  print("Same user with different subject");
  print(userdata2);
  print("Same user with different subject");
  print(userdata3);
  print("Same user id changed with different subject");
  print(userdata4);
}
