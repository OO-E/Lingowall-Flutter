class CatalogModel {
  static String loremIpsum = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";
  static final items = [
    Item(
        id: 1,
        name: "iPhone 12",
        desc: "Face ID, accelerometer",
        price: 999,
        color: "#33505a",
        image:
        "https://cdn.pocket-lint.com/r/s/970x/assets/images/154302-phones-review-iphone-12-pro-review-product-shots-image3-wd487ybwpf.jpg"),
    Item(
        id: 2,
        name: "iPhone 13 pro",
        desc: "iPhones get the best apps first",
        price: 1199,
        color: "#33505a",
        image:
        "https://www.apple.com/v/iphone-13-pro/c/images/overview/design/finishes_1_sierra_blue__2bovafkl4yaa_large.jpg"),
    Item(
        id: 3,
        name: "IPhone 13",
        desc: "The software will always be up-to-date",
        price: 1299,
        color: "#33505a",
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfOxwodBL81UDhB4syHn3gYZOhD3EqjD_LDMyvmBaOt8JUxrcEVgA85FbJT4IJGyqhJfU&usqp=CAU"),
    Item(
        id: 4,
        name: "iPhone 11",
        desc: "Great customer support",
        price: 899,
        color: "#33505a",
        image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2YWQPNddTCfot6bCPOcq5wuc2D_LothyquLDIwTyxG6GVguUeSmUNHuVIT2v-arNIV-E&usqp=CAU"),
    Item(
        id: 5,
        name: "iPhone 10",
        desc: "Better design",
        price: 799,
        color: "#33505a",
        image:
        "https://www.gizmochina.com/wp-content/uploads/2019/09/Apple-iPhone-11-1.jpg"),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
        required this.name,
        required this.desc,
        required this.price,
        required this.color,
        required this.image});
}