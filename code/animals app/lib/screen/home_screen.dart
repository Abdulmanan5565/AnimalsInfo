import 'package:animal_info/data/animal_data.dart';
import 'package:animal_info/screen/aboutus_screen.dart';
import 'package:animal_info/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kind of Animals"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutScreen(),
              ),
            );
          },
          child: const Text("about"),
        ),
        body: ListView.builder(
            itemCount: animalList.length,
            itemBuilder: (con, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: (() {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(detail: animalList[index], ),
                        ),
                      );
                    }),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        animalList[index]['img'],
                        width: 50,
                      ),
                    ),
                    title: Text("${animalList[index]['title']}"),
                  ),
                  Divider()
                ],
              );
            }));
  }
}
