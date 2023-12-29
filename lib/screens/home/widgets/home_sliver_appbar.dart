import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_movie_app/bloc/search/search_movies_bloc.dart';
import 'package:gdsc_movie_app/bloc/search/search_movies_state.dart';
import 'package:gdsc_movie_app/bloc/search/search_movies_event.dart';
import 'package:gdsc_movie_app/constants/gaps.dart';
import 'package:gdsc_movie_app/constants/sizes.dart';
import 'package:gdsc_movie_app/screens/profile/profile_screen.dart';
import 'package:gdsc_movie_app/screens/search/search_screen.dart';
import 'package:gdsc_movie_app/widgets/common_input_widget.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  void _onChange(
    BuildContext context, {
    required String value,
  }) {
    context
      .read<SearchMoviesBloc>()
      .add(SearchMoviesOnQueryChangeEvent(query: value));
  }

  void _onSubmit(
    BuildContext context, {
    required String value,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchScreen(),
      ),
    );
}

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
        collapseMode: CollapseMode.pin,
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
                      onPressed: () {},
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
                child: BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
                  builder: (context, state) => CommonInputWidget(
                    value: state.query,
                    onChange: (value) => _onChange(context, value: value),
                    onSubmit: (value) => _onSubmit(context, value: value),
                  ),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}