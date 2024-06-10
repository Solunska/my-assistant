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
      audio: 'assets/audio/circle.mp3'),
  Shape(
      title: 'ТРИАГОЛНИК',
      image: 'assets/shapes/triangle.png',
      audio: 'assets/audio/triangle.mp3'),
  Shape(
      title: 'КВАДРАТ',
      image: 'assets/shapes/square.png',
      audio: 'assets/audio/square.mp3'),
  Shape(
      title: 'ПРАВОАГОЛНИК',
      image: 'assets/shapes/rectangle.png',
      audio: 'assets/audio/rectangle.mp3'),
];
