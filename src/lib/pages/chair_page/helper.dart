class Chair {
  String image;
  String title;
  String subTitle;
  String price;

  Chair({
    required this.image,
    required this.price,
    required this.subTitle,
    required this.title,
  });
}

List<Chair> listOfItems = [
  Chair(
      image: "assets/chair1.png",
      price: "1,512",
      title: "Wingback Chair",
      subTitle: "Medulus Sadi Arena"),
  Chair(
      image: "assets/chair2.png",
      price: "1,895",
      title: "Nanlville ArmChair",
      subTitle: "Concent with comfort"),
];
