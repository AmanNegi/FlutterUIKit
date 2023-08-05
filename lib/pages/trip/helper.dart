List<TripItem> tripList = [
  TripItem(
      "https://images.unsplash.com/photo-1497436072909-60f360e1d4b1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80",
      "All Green",
      "GreenLand"),
  TripItem(
      "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
      "Mount Olympus",
      "Greece"),
  TripItem(
      "https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
      "The RainForest",
      "China"),
];

class TripItem {
  String image;
  String name;
  String city;

  TripItem(this.image, this.name, this.city);
}
