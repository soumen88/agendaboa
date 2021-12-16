// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i5;

import '../ui/first_page.dart' as _i3;
import '../ui/home.dart' as _i1;
import '../ui/second_page.dart' as _i4;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    PostsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    UsersRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    FirstRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.FirstPage());
    },
    SecondRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.SecondPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/', children: [
          _i2.RouteConfig(PostsRouter.name,
              path: 'posts',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(FirstRoute.name,
                    path: '', parent: PostsRouter.name),
                _i2.RouteConfig(SecondRoute.name,
                    path: ':postId', parent: PostsRouter.name)
              ]),
          _i2.RouteConfig(UsersRouter.name,
              path: 'posts',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(FirstRoute.name,
                    path: '', parent: UsersRouter.name),
                _i2.RouteConfig(SecondRoute.name,
                    path: ':postId', parent: UsersRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PostsRouter extends _i2.PageRouteInfo<void> {
  const PostsRouter({List<_i2.PageRouteInfo>? children})
      : super(PostsRouter.name, path: 'posts', initialChildren: children);

  static const String name = 'PostsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class UsersRouter extends _i2.PageRouteInfo<void> {
  const UsersRouter({List<_i2.PageRouteInfo>? children})
      : super(UsersRouter.name, path: 'posts', initialChildren: children);

  static const String name = 'UsersRouter';
}

/// generated route for
/// [_i3.FirstPage]
class FirstRoute extends _i2.PageRouteInfo<void> {
  const FirstRoute() : super(FirstRoute.name, path: '');

  static const String name = 'FirstRoute';
}

/// generated route for
/// [_i4.SecondPage]
class SecondRoute extends _i2.PageRouteInfo<void> {
  const SecondRoute() : super(SecondRoute.name, path: ':postId');

  static const String name = 'SecondRoute';
}
