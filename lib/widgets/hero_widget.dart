import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  HeroModel data;

  HeroWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 6,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    data.imageUrl,
                ),
                fit: BoxFit.cover
              )
            ),
            constraints: const BoxConstraints(
              minHeight: 500,
              minWidth: double.infinity,
            ),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.black,
                  constraints: const BoxConstraints(
                    minWidth: double.maxFinite
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.description,
                      maxLines: 1 ,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
              )
          )
      ),
    );
  }
}


class HeroGridWidget extends StatelessWidget {
  
  final List<HeroModel> heroes;
  final Function refreshData;
  
  const HeroGridWidget({
    super.key,
    required this.heroes,
    required this.refreshData
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: heroes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0
        ), itemBuilder: (context, index) {
            if (heroes.length == index + 5 ) refreshData(heroes.length);
            return HeroWidget(
              data: heroes[index],
            );
        });
  }
}


class HeroModel {
  late String imageUrl;
  late String description;

  HeroModel(this.imageUrl, this.description);
}