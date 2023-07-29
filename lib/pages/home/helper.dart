List<String> randomNames = [
  "Chezaru",
  "Riha",
  "Milet",
  "Misizu",
  "Mitchell",
  "Marrie",
  "Megan",
  "Christene",
  "Touka",
];

final List<Person> list = [
  Person("Mitchell Barber", "assets/person1.jpg", "New on Vision",
      "Been through 2 stops you're following incoping with depression"),
  Person("Marrie George", "assets/person2.jpg", "New on Vision",
      "Been through 2 stops you're following incoping with depression"),
];

class Person {
  String name;
  String image;
  String subtitle;
  String detail;

  Person(this.name, this.image, this.subtitle, this.detail);
}
