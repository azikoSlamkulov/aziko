import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<CustomNavigationDestination> destinations = [
  const CustomNavigationDestination(
    label: 'Home',
    icon: FaIcon(FontAwesomeIcons.house),
    selectedIcon: FaIcon(FontAwesomeIcons.house),
    route: '/',
  ),
  const CustomNavigationDestination(
    label: 'Widgets',
    icon: FaIcon(FontAwesomeIcons.list),
    selectedIcon: FaIcon(FontAwesomeIcons.list),
    route: '/widgets',
  ),
  const CustomNavigationDestination(
    label: 'Favorites',
    icon: FaIcon(FontAwesomeIcons.heart),
    selectedIcon: FaIcon(FontAwesomeIcons.solidHeart),
    route: '/favorites',
  ),
  const CustomNavigationDestination(
    label: 'Test',
    icon: FaIcon(FontAwesomeIcons.file),
    selectedIcon: FaIcon(FontAwesomeIcons.solidFile),
    route: '/test',
  ),
  const CustomNavigationDestination(
    label: 'Profile',
    icon: FaIcon(FontAwesomeIcons.user),
    selectedIcon: FaIcon(FontAwesomeIcons.solidUser),
    route: '/profile',
  ),
];

class CustomNavigationDestination {
  const CustomNavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.child,
  });

  final String route;
  final String label;
  final Widget? icon;
  final Widget? selectedIcon;
  final Widget? child;
}
