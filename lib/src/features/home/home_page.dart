import 'package:flutter/material.dart';
import 'package:the_movie_db/src/features/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/src/features/movies/display/movies_page.dart';
import 'package:the_movie_db/src/features/profile/profile_page.dart';
import 'package:the_movie_db/src/features/tvs/tvs_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return Scaffold(
      body: IndexedStack(
        index: selectedTab.index,
        children: const [MoviesPage(), TvsPage(), ProfilePage()],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.movies,
              icon: const Icon(Icons.movie_filter_outlined),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.tvs,
              icon: const Icon(Icons.tv),
            ),
            _HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.profile,
              icon: const Icon(Icons.person_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      iconSize: 32,
      color:
          groupValue != value ? null : Theme.of(context).colorScheme.secondary,
      icon: icon,
    );
  }
}
