const initialCode = r"""class Greeter {
  var name;
  Greeter(this.name);

  void greet() => print("Hello $name!");
}

void main() {
  var g = new Greeter("world");
  g.greet();
}""";

const initialOutput = """
    main: function() {
      H.printString("Hello world!");
    }""";
