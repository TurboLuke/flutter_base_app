import 'package:flutter/material.dart';
import 'package:flutter_base_app/models/menu_item_model.dart';
import 'package:flutter_base_app/pages/widgets/app_bar_widget.dart';
import 'package:flutter_base_app/pages/widgets/side_scroll_items_widget.dart';
import 'package:flutter_base_app/services/data_service.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final MenuItemModel item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final DataProvider dataProvider = Provider.of<DataProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows content to go behind the AppBar
      appBar: CustomAppBar(title: "", isTransparent: true),

      body: Container(
        color: Color(0xff9DCEFF), // Background color for the whole screen
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 400,
              color: Color(
                0xff9DCEFF,
              ), // Ensures this part blends into the background
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SvgPicture.asset(
                  // SVG image
                  item.iconPath,
                ),
              ),
            ),
            Container(
              height: 700, // calculate the height of the remaining screen
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), // Adjust for smoothness
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      item.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    SideScrollItemsComponent(
                      title: "Nutrition",
                      categories: dataProvider.nutritions,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'This is a detail description. Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 120, 120, 120),
                        fontSize: 16,
                      ),
                    ),

                    // add material flat button here fit the whole width should absolute positioned at the bottom
                    SizedBox(height: 20),
                    Material(
                      color: Color(0xff9DCEFF),
                      borderRadius: BorderRadius.circular(50),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
