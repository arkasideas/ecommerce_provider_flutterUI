import 'package:ecommerce_provider/model/product_model.dart';
import 'package:ecommerce_provider/screens/Home/Widget/home_app_bar.dart';
import 'package:ecommerce_provider/screens/Home/Widget/image_slider.dart';
import 'package:ecommerce_provider/screens/Home/Widget/product_cart.dart';
import 'package:ecommerce_provider/screens/Home/Widget/search_bar.dart';
import 'package:flutter/material.dart';

import '../../model/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35),
              CustomAppBar(),
              SizedBox(height: 20),
              MySearchBAR(),
              SizedBox(height: 20),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == index
                              ? Colors.blue[200]
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage(categoriesList[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              categoriesList[index].title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: selectedCategories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: selectedCategories[selectedIndex][index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
