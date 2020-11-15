class Animal {
  String _name;
  double _heigth;
  int _weight;
  String _favFood;
  double _speed;
  String _sound;

  Flys flyingType;

  set name(String name) => _name = name;
  String get name => _name;

  set height(double height) => _heigth = height;
  double get hegth => _heigth;

  set wight(String weigth) => wight = weigth;
  int get Name => _weight;

  set faveFood(String favFood) => _favFood = favFood;
  String get favFood => _favFood;

  set speed(double speed) => _speed = speed;
  double get speed => _speed;

  set sound(String sound) => sound = sound;
  String get sound => _sound;

  String tryToFly() => flyingType.fly();

  set flyAbilyte(Flys newFlyHability) => flyAbilyte = newFlyHability;
}

class CantFly implements Flys {
  @override
  String fly() => 'I can\'t fly';
}

abstract class Flys {
  String fly();
}

class ItFlys implements Flys {
  String fly() => 'Flying High';
}

class Dog extends Animal {
  Dog() {
    _sound = 'Bark';

    flyingType = new CantFly();
  }
}

class Bird extends Animal {
  Bird() {
    _sound = 'Tweet';

    flyingType = new ItFlys();
  }
}

void main() {
  Animal sparky = new Dog();
  Animal tweety = new Bird();

  print('Dog ${sparky.tryToFly()}');
  print('Bird ${tweety.tryToFly()}');

  sparky.flyAbilyte = ItFlys();

  print('Dog ${sparky.tryToFly()}');
}
