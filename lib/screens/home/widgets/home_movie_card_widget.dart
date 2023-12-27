import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/constants/sizes.dart';

class HomeMovieCardWidget extends StatelessWidget {
  final String title;

  const HomeMovieCardWidget({
    super.key,
    required this.title,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size5),
        color: Colors.blueGrey.shade300,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            'https://img.freepik.com/free-vector/cinema-realistic-poster-with-illuminated-bucket-popcorn-drink-3d-glasses-reel-tickets-blue-background-with-tapes-vector-illustration_1284-77070.jpg',
            width: double.infinity, 
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: Sizes.size5,
                sigmaY: Sizes.size5,
              ),
              child: Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(Sizes.size5),
                child: Text(
                  'name - $title',
                  style: const TextStyle(
                    color: Colors.white,
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