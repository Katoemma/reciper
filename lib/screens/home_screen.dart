import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reciper/components/home%20widgets/category.dart';
import 'package:reciper/components/home%20widgets/featured.dart';
import 'package:reciper/components/home%20widgets/greetings_header.dart';
import 'package:reciper/components/home%20widgets/popular_recipes.dart';
import 'package:reciper/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const GreetingsHeader(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text(
                  'Featured',
                  style: GoogleFonts.sofia(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const FeaturedRecipes(),
              SizedBox(
                height: height * 0.02,
              ),
              const CategoryTabs(),
              SizedBox(
                height: height * 0.02,
              ),
              const PopularRecipes(),
            ],
          ),
        ),
      ),
    );
  }
}
