class Food {
  final String title;
  final String image;
  final String audio;

  Food({
    required this.title,
    required this.image,
    required this.audio,
  });
}

List<Food> foods = [
  Food(
      title: 'ЈАБОЛКО',
      image: 'assets/food/apple.png',
      audio: 'assets/audio/hello.mp3'),
];
