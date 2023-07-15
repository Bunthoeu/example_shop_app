class Categories {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Categories(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  static List<Categories> generatlist() {
    return [
      Categories(
          id: 1,
          name: "Gamge",
          image: 'assets/icons/game.png',
          creationAt: "2023-06-21T06:37:02.000Z",
          updatedAt: "2023-06-21T06:37:02.000Z"),
      Categories(
          id: 1,
          name: "Flash",
          image: 'assets/icons/flash.png',
          creationAt: "2023-06-21T06:37:02.000Z",
          updatedAt: "2023-06-21T06:37:02.000Z"),
      Categories(
          id: 1,
          name: "Gift",
          image: 'assets/icons/gift.png',
          creationAt: "2023-06-21T06:37:02.000Z",
          updatedAt: "2023-06-21T06:37:02.000Z"),
      Categories(
          id: 1,
          name: "More",
          image: 'assets/icons/more.png',
          creationAt: "2023-06-21T06:37:02.000Z",
          updatedAt: "2023-06-21T06:37:02.000Z"),
      Categories(
          id: 1,
          name: "Bill",
          image: 'assets/icons/invoice.png',
          creationAt: "2023-06-21T06:37:02.000Z",
          updatedAt: "2023-06-21T06:37:02.000Z"),
    ];
  }
}
