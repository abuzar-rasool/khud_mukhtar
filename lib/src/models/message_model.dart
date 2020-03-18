import 'user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });


}

// YOU - current user
final User currentUser = User(
  id: '0',
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERS
final User greg = User(
  id: '1',
  name: 'Kunza Rizvi',
  imageUrl: 'assets/cm1.jpeg',
);
final User james = User(
  id: '2',
  name: 'Aleena Zahid',
  imageUrl: 'assets/cm0.jpeg',
);
final User john = User(
  id: '3',
  name: 'Momina Qureshi',
  imageUrl: 'assets/momina.jpg',
);
final User olivia = User(
  id: '4',
  name: 'Anum Khan',
  imageUrl: 'assets/cm2.jpeg',
);
final User sam = User(
  id: '5',
  name: 'Yusra Shaikh',
  imageUrl: 'assets/cm3.jpeg',
);
final User sophia = User(
  id: '6',
  name: 'Yusra Ali',
  imageUrl: 'assets/cm4.jpeg',
);
final User steven = User(
  id: '7',
  name: 'Fatima Arshad',
  imageUrl: 'assets/profile.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'I like your Quran Classes services. Please more info.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Nahi pata. Dekh kar batatati hoon.',
    isLiked: false,
      unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Jee bilkul. Discount mil jayega',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Sure. I will get back to you soon.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Does 5pm work for you?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'I like your service regarding tutions',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Hello, glad you liked it. I offer them twice a week.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'What days?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: '?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Tuesday and Thursdays.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'What grades do you teach?',
    isLiked: false,
    unread: true,
  ),
];
