import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/constant.dart';
import 'package:recipe_app/model/categories.dart';
import 'package:recipe_app/model/product.dart';

import 'detail.dart';
import 'model/users.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menus = [
    'Breakfast', 'Lunch', 'Dinner', 'Snack', 'Chat Menu'
  ];
  String selectedMenu = 'Breakfast';
  List<IconData> icons = [
    Icons.home_rounded,
    Icons.bar_chart_rounded,
    Icons.favorite_outline_rounded,
    Icons.person_outline_rounded,
  ];
  int selectPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.shade100,
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(users[1].name, style: roboto.copyWith(
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal
                          ),),
                          Text('What do you wan to eat today ?', style: roboto.copyWith(
                            fontSize: 12, color: Colors.black.withOpacity(0.5)
                          ),),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(users[1].image),
                            fit: BoxFit.cover
                          )
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: grey.shade200
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: roboto,
                        prefixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                          "Popular Menu",
                          style: roboto.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                      ),
                      Spacer(),
                      Text(
                          "See all",
                          style: roboto.copyWith(
                            color: green, fontWeight: FontWeight.normal,
                            fontSize: 14
                          ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(menus.length, (index) =>
                        Padding(
                          padding: index == 0
                              ? EdgeInsets.only(left: 20, right: 10)
                              : index == menus.length - 1
                                  ? EdgeInsets.only(right: 20)
                                  : EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedMenu = menus[index];
                              });
                            },
                            child: MenuItem(
                                selectMenu: selectedMenu,
                                menu: menus[index]
                            ),
                          ),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(products.length, (index) =>
                        Padding(
                          padding: index == 0
                              ? EdgeInsets.only(left: 20, right: 10)
                              : index == products.length - 1
                                ? EdgeInsets.only(right: 20)
                                : EdgeInsets.only(right: 10),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(product: products[index])));
                              },
                              child: ProductItem(product: products[index] ,)
                          ),
                        )
                    )
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                          "Categories",
                          style: roboto.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                      ),
                      Spacer(),
                      Text(
                          "See all",
                          style: roboto.copyWith(
                            color: green, fontWeight: FontWeight.normal,
                            fontSize: 14
                          ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(categories.length, (index) =>
                    Padding(
                      padding: index == 0
                        ? EdgeInsets.only(left: 20, right: 20)
                          : EdgeInsets.only(right: 20),
                      child: CategoryItem(category: categories[index],),
                    )
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(users.length, (index) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: UserItem(user: users[index],),
                        )
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      bottomNavigationBar: Container(
        height: 50,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icons.length, (index) =>
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectPage = index;
                  });
                },
                child: SizedBox(
                  height: 40,
                  width: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        color: index == selectPage ? green : grey,
                        size: 28,),
                      index == selectPage ?
                      Container(
                        height: 3,
                        width: 30,
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      )
                      : Container()
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final User user;
  const UserItem({
    super.key, required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(user.image),
                  fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name, style: roboto.copyWith(color: black, fontSize: 14, fontWeight: FontWeight.bold),),
              Text("12 Recipes Shared", style: roboto.copyWith(color: black.withOpacity(0.5), fontSize: 14),),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    super.key, required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: category.color
          ),
          child: Image.asset(category.image),
        ),
        SizedBox(height: 5,),
        Text(category.name, style: roboto.copyWith(
          color: black,
          fontWeight: FontWeight.bold,
          fontSize: 12
        ),)
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.menu, required this.selectMenu,
  });

  final String menu;
  final String selectMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: menu == selectMenu ? green : white
      ),
      child: Text(menu,
        style: roboto.copyWith(
            color:  menu == selectMenu ? white : black
        ),),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width/2-40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(product.image),
          fit: BoxFit.cover
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              color: black.withOpacity(0.5)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 1,
                        style: roboto.copyWith(
                            color: white,
                          fontWeight: FontWeight.bold
                        ),),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_rounded, color: orange, size: 18,),
                        Text("${product.rate}", style: roboto.copyWith(color: white),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 3,),
                Text('1 Bow (${product.weight}) g', style: roboto.copyWith(color: white),),
                SizedBox(height: 3,),
                Text('${product.calorie} Kkal | 25% AKG', style: roboto.copyWith( color: white),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
