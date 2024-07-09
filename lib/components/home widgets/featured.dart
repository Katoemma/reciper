import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedRecipes extends StatefulWidget {
  const FeaturedRecipes({super.key});

  @override
  State<FeaturedRecipes> createState() => _FeaturedRecipesState();
}

class _FeaturedRecipesState extends State<FeaturedRecipes> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Swiper(
      autoplay: true,
      layout: SwiperLayout.CUSTOM,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
          .addRotate([-0.0 / 180, 0.0, 0.0 / 180]).addTranslate([
        const Offset(-370.0, -40.0),
        const Offset(0.0, 0.0),
        const Offset(335.0, -0.0)
      ]),
      itemWidth: width * 0.73,
      itemHeight: height * 0.18,
      itemBuilder: (context, index) {
        return new Container(
          height: height * 0.18,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/rice.jpg'),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
              color: Colors.black.withOpacity(0.7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Classic Margherita Pizza',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://media.licdn.com/dms/image/C4D03AQEeEyYzNtDq7g/profile-displayphoto-shrink_400_400/0/1524234561685?e=2147483647&v=beta&t=CJY6IY9Bsqc2kiES7HZmnMo1_uf11zHc9DQ1tyk7R7Y',
                          ),
                        ),
                        Text(
                          'Max Aldo',
                          style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: Colors.amber,
                        ),
                        Text(
                          ' 20 Min',
                          style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
      pagination: const SwiperPagination(
        alignment: Alignment.topCenter,
        builder: SwiperPagination.dots,
      ),
      itemCount: 5,
    );
  }
}
