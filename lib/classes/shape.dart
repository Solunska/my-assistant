class Shape {
  final String title;
  final String image;
  final String audio;

  Shape({
    required this.title,
    required this.image,
    required this.audio,
  });
}

List<Shape> shapes = [
  Shape(
      title: 'КРУГ',
      image: 'assets/shapes/circle2.png',
      audio: 'assets/audio/hello.mp3'),
  Shape(
      title: 'ТРИАГОЛНИК',
      image: 'assets/shapes/triangle.png',
      audio: 'assets/audio/hello.mp3'),
  Shape(
      title: 'КВАДРАТ',
      image: 'assets/shapes/square.png',
      audio: 'assets/audio/hello.mp3'),
  Shape(
      title: 'ПРАВОАГОЛНИК',
      image: 'assets/shapes/rectangle.png',
      audio: 'assets/audio/hello.mp3'),
];
