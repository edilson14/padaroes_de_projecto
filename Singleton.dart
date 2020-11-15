class Singleton {
  static Singleton instance;

  Singleton._();

  static Singleton getInstance() {
    Singleton.instance ?? new Singleton._();
    return Singleton.instance;
  }
}

void main() {
  final singleton1 = Singleton.getInstance();
  final singleton2 = Singleton.getInstance();

  singleton1 == singleton2
      ? print('Singleton works')
      : print('Singleton doesn\'t work ');
}
