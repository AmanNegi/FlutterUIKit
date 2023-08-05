List<SushiItem> listSushiItem = [
  SushiItem("URA-MAKI ROLLS", "assets/sushi1.png"),
  SushiItem("MAKI ROLLS", "assets/sushi4.png"),
  SushiItem("FISH", "assets/sushi2.png"),
  SushiItem("SUSHI", "assets/sushi3.png"),
];

class SushiItem {
  String text;
  String image;

  SushiItem(this.text, this.image);
}
