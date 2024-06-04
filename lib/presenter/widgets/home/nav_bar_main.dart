import 'package:flutter/material.dart';
import 'package:r6_moovie_app/presenter/pages/favorites/favorites_movies_screen.dart';
import 'package:r6_moovie_app/presenter/pages/favorites/favorites_series_screen.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

class NavBarMain extends StatelessWidget {
  const NavBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 60),
          _buildNavItem(
            title: AppStrings.home,
            onTap: () {},
          ),
          _buildNavItem(
            title: AppStrings.myProfile,
            onTap: () {},
          ),
          _buildNavItem(
            title: AppStrings.populars,
            onTap: () {},
          ),
          _buildNavItem(
            title: AppStrings.myMoviesFavorites,
            onTap: () => _navigateToScreen(context, FavoritesMoviesScreen()),
          ),
          _buildNavItem(
            title: AppStrings.mySeriesFavorites,
            onTap: () => _navigateToScreen(context,  FavoritesSeriesScreen()),
          ),
          _buildNavItem(
            title: AppStrings.about,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  ListTile _buildNavItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: AppSize.s30,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
