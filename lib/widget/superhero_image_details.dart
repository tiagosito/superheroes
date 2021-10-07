import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superheroes/model/current_superhero.dart';
import 'package:superheroes/shared/utils.dart';

class SuperHeroImageDetails extends StatelessWidget {
  const SuperHeroImageDetails({
    Key? key,
    required this.currentSuperhero,
    required this.size,
  }) : super(key: key);

  final CurrentSuperHero currentSuperhero;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: currentSuperhero.superhero.images == null || currentSuperhero.superhero.images!.lg == null
                ? ConstValues.cachedNetworkImagePlaceholder
                : currentSuperhero.superhero.images!.lg!,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.fill,
            height: size.height * 0.55,
            width: size.width,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 65,
              width: size.width,
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        currentSuperhero.superhero.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentSuperhero.superhero.biography!.placeOfBirth!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
