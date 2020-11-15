abstract class Builder {
  void producePartA();
  void producePartB();
  void producePartC();
}

class ConcretBuilder1 implements Builder {
  Product1 _product;

  ConcretBuilder1() {
    this.reset();
  }

  reset() {
    _product = new Product1();
  }

  @override
  void producePartA() {
    _product.parts.add('PartA1');
  }

  @override
  void producePartB() {
    _product.parts.add('PartB1');
  }

  @override
  void producePartC() {
    _product.parts.add('PartC1');
  }

  Product1 getProduct() {
    final result = _product;

    this.reset();
    return result;
  }
}

class Product1 {
  List<String> parts = [];

  void listParts() => print(" Product parts: ${parts.join(', ')}\n");
}

class Director {
  Builder _builder;

  void setBuilder(Builder builder) => _builder = builder;

  void buildMinValiableProduct() => _builder.producePartA();

  void buildFullProduct() {
    _builder.producePartA();
    _builder.producePartB();
    _builder.producePartC();
  }
}

void client(Director director) {
  final builder = new ConcretBuilder1();
  director.setBuilder(builder);

  // Example with only one builder
  print('Standart basic product');
  director.buildMinValiableProduct();
  builder.getProduct().listParts();

  // Exemple with all builder's
  print('Standart full feature product');
  director.buildFullProduct();
  builder.getProduct().listParts();

  // Builder without Director Class
  print('Custom product without director');
  builder.producePartA();
  builder.producePartC();
  builder.getProduct().listParts();
}

void main() {
  final Director director = new Director();
  client(director);
}
