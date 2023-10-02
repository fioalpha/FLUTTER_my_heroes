
class Hero {
  final String name;
  final String image;

  Hero({required this.image, required this.name});

  @override
  bool operator ==(Object other)  {
    if (other is! Hero) return false;
    if (name != other.name) return false;
    if(image != other.image) return false;
    return true;
  }

  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + name.hashCode;
    result = 37 * result + image.hashCode;
    return result;
  }

}

