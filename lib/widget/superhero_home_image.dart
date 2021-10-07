import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';
import 'package:superheroes/shared/utils.dart';

class SuperHeroHomeImage extends StatelessWidget {
  const SuperHeroHomeImage({
    Key? key,
    required this.size,
    required this.onTap,
    required this.currentSuperhero,
  }) : super(key: key);

  final Size size;
  final Function onTap;
  final CurrentSuperHero currentSuperhero;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: .0,
      left: .0,
      //right: .0,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: InkWell(
              onTap: () {
                onTap.call();
              },
              child: Hero(
                tag: currentSuperhero.superhero.id,
                child: CachedNetworkImage(
                  imageUrl: currentSuperhero.superhero.images == null || currentSuperhero.superhero.images!.sm == null
                      ? ConstValues.cachedNetworkImagePlaceholder
                      : currentSuperhero.superhero.images!.sm!,
                  progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                  height: 170,
                  width: 120,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
