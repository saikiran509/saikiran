import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_screen/app/module/home/controllers/home_controller.dart';

class HomeScreenBody extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (homeController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          return Container(
            color: Colors.black,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0,
              ),
              itemCount: homeController.results.length,
              itemBuilder: (context, index) {
                var result = homeController.results[index];
                return Container(
                  height: 300.0, // Increase the height to 300.0
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/original" +
                        result['poster_path'].toString(),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
