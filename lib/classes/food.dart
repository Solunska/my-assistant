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
      audio: 'assets/audio/hello.mp3'
    ),
  Food(
      title: 'БАНАНА',
      image: 'assets/food/banana.png',
      audio: 'assets/audio/hello.mp3'
    ),
      Food(
      title: 'МОРКОВ',
      image: 'assets/food/carrot.png',
      audio: 'assets/audio/hello.mp3'
    ),
      Food(
      title: 'ПОРТОКАЛ',
      image: 'assets/food/orange.png',
      audio: 'assets/audio/hello.mp3'
    ),
      Food(
      title: 'КРУША',
      image: 'assets/food/pear.png',
      audio: 'assets/audio/hello.mp3'
    ),
      Food(
      title: 'ЛУБЕНИЦА',
      image: 'assets/food/watermelon.png',
      audio: 'assets/audio/hello.mp3'
    )


];
