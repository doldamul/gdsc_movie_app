import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/constants/gaps.dart';
import 'package:gdsc_movie_app/constants/sizes.dart';
import 'package:gdsc_movie_app/screens/profile/profile_screen.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: 200,
      collapsedHeight: 80,
      pinned: true,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Sizes.size48),
        ),
      ),
      forceElevated: true,
      floating: true,
      shadowColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        background: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'GDSC Movie',
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print('on pressed');
                      },
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Gaps.v5,
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.shade400,
                      ),
                      Gaps.h10, 
                      const Text(
                        '000님 어서오세요',
                        style: TextStyle( 
                          fontSize: Sizes.size14,
                          color: Colors.white,
                        )
                      ),
                      Gaps.h5,
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: Sizes.size12,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size20),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: Sizes.size3,
                sigmaY: Sizes.size3,
              ),
              child: Container(
                width: double.infinity,
                height: Sizes.size48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.size20),
                  color: Colors.black54,
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
                child: const Text(
                  'search',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}