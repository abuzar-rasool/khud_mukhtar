import 'dart:math';

Random random = Random();
List names = [
  "Muneeba Amir",
  "Ayesha Baloch",
  "Iqra Asif",
  "Fatima Moin",
  "Syeda Fatima",
  "Areeba Farooq",
  "Amna Arif",
  "Maryam Khan",
  "Krinza Momin",
  "Tehreem Zafar",
  "Ambreen Ashraf",
];

List notifs = [
  "${names[random.nextInt(10)]}  liked your post",
  "${names[random.nextInt(10)]} uploaded a new post",
  "${names[random.nextInt(10)]} is providing a free service",
  "${names[random.nextInt(10)]} followed you",
  "${names[random.nextInt(10)]} liked your service",
  "${names[random.nextInt(10)]} posted a new service",
  "${names[random.nextInt(10)]} posted a blog",
  "${names[random.nextInt(10)]} followed you",
  "${names[random.nextInt(10)]} followed you",
  "${names[random.nextInt(10)]} posted a new service",
  "${names[random.nextInt(10)]} followed you",
];

List notifications = List.generate(
    13,
    (index) => {
          "name": names[random.nextInt(10)],
          "dp": "assets/cm${random.nextInt(10)}.jpeg",
          "time": "${random.nextInt(50)} min ago",
          "notif": notifs[random.nextInt(10)]
        });
