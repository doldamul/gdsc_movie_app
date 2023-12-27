import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/screens/home/widgets/home_card_widget.dart';
import 'package:gdsc_movie_app/screens/home/widgets/home_sliver_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        slivers: [
          const HomeSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const HomeCardWidget(title: '오늘의 영화'),
                const HomeCardWidget(title: '높은 평점'),
                const HomeCardWidget(title: '인기 영화'),
                const HomeCardWidget(title: '액션'),
                const HomeCardWidget(title: '애니메이션'),
                const HomeCardWidget(title: '판타지'),
                const HomeCardWidget(title: '로맨스'),
                const HomeCardWidget(title: '스릴러'),
                const HomeCardWidget(title: '인디'),
                const HomeCardWidget(title: '개발자 추천'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
