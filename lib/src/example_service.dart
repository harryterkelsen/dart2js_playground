import 'package:angular2/angular2.dart';

@Injectable()
class ExampleService {
  final Map<String, String> examples = const <String, String>{
    'Greeter': r'''class Greeter {
  var name;
  Greeter(this.name);

  void greet() => print("Hello $name!");
}

void main() {
  var g = new Greeter("world");
  g.greet();
}''',
    'Animals': r'''void main() {
  var animal = new Animal();
  animal.consume(new Water(5));
}

class Animal {
  void consume(something) {
    if (something is Food) {
      print('Ate ${something.weight} pounds');
    } else if (something is Water) {
      print('Drank ${something.amount} liters');
    } else {
      throw 'Unexpected: ${something.runtimeType}';
    }
  }
}

class Food {
  final int weight;
  const Food(this.weight);
}

class Water {
  final int amount;
  const Water(this.amount);
}''',
    'Math': r'''import 'dart:math';

num square(num x) => x * x;

class Point {
  num x, y;

  Point(this.x, this.y);

  num distance(Point other) {
    return sqrt(square(x - other.x) +
        square(y - other.y));
  }
}

main() {
  var origin = new Point(0, 0);
  var other = new Point(1, 1);
  print(origin.distance(other));
}''',
    'Loop Code Motion': '''class A {
  final int y;
  final int z;
  A(this.y, this.z);

  foo() {
    var n = 10;
    var a = new List(n);
    for (int i = 0; i < n; i++) {
      var x = y + z;
      a[i] = 6 * i + x * x;
    }
    print(a);
  }
}

main() {
  var a = new A(1, 2);
  a.foo();
}''',
  };
}
