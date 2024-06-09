class Greeting {
  final String title;
  final String image;
  final String audio;

  Greeting({
    required this.title,
    required this.image,
    required this.audio,
  });
}

List<Greeting> greetings = [
  Greeting(
    title: 'ДОБРО УТРО',
    image: 'assets/greetings-images/good-morning.png',
    audio: 'assets/audio/hello.mp3',
  ),
  Greeting(
    title: 'ДОБРА НОЌ',
    image: 'assets/greetings-images/good-night.png',
    audio: 'assets/audio/hello.mp3',
  ),
  Greeting(
    title: 'ЗДРАВО',
    image: 'assets/greetings-images/hello.png',
    audio: 'assets/audio/hello.mp3',
  ),
  Greeting(
    title: 'ПРИЈАТНО',
    image: 'assets/greetings-images/goodbye.png',
    audio: 'assets/audio/hello.mp3',
  ),
];
