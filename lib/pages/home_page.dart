import 'package:flutter/material.dart';
import 'package:flutter_base_app/models/menu_item_model.dart';
import 'package:flutter_base_app/pages/widgets/app_bar_widget.dart';
import 'package:flutter_base_app/pages/widgets/side_scroll_items_widget.dart';
import 'package:flutter_base_app/pages/detail_page.dart';
import 'package:flutter_base_app/services/data_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(title: "Breakfast", isTransparent: false),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // search bar
          _searchBar(),
          // spacer
          SizedBox(height: 20),

          // category
          Padding(
            padding: const EdgeInsets.all(20),
            child: SideScrollItemsComponent(
              title: "Category",
              categories: dataProvider.categories,
            ),
          ),

          SizedBox(height: 20),

          // menu items
          _menuItems(dataProvider.menuItems),
        ],
      ),
    );
  }

  Padding _menuItems(List<MenuItemModel> menuItems) {
    return Padding(
   padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menu Items',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 15),
          ListView.separated(
            itemCount: menuItems.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(height: 25),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1D1617).withOpacity(0.07),
                      offset: const Offset(0, 10),
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      menuItems[index].iconPath,
                      width: 65,
                      height: 65,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menuItems[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${menuItems[index].level} | ${menuItems[index].duration} | ${menuItems[index].calorie}',
                          style: const TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_circle_right_outlined,
                        color: const Color.fromARGB(255, 142, 142, 142),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    DetailPage(item: menuItems[index]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container _searchBar() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 248, 248),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 227, 227, 227).withValues(),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      child: Container(
        // icon text field
        child: Row(
          children: [
            // icon
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Icon(Icons.search, size: 25, color: Colors.grey),
            ),
            // text field
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for recipes',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 208, 208, 208),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                child: InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.tune, color: Colors.black, size: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
