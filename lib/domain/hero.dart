class Hero {
  final String name;
  final String image;

  Hero({required this.image, required this.name});

  static Hero createFake() {
    return Hero(image: "https://fastly.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI", name: "asdf");
  }
}

