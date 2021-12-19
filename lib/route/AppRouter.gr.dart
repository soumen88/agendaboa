// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../ui/first_page.dart' as _i2;
import '../ui/home.dart' as _i1;
import '../ui/second_page.dart' as _i3;
import '../ui/third_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.HomePage(key: args.key));
    },
    FirstPageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.FirstPage());
    },
    SecondPageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SecondPage());
    },
    ThirdPageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.ThirdPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/', children: [
          _i5.RouteConfig(FirstPageRouter.name,
              path: 'firstPage',
              parent: HomeRoute.name,
              children: [
                _i5.RouteConfig('*#redirect',
                    path: '*',
                    parent: FirstPageRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i5.RouteConfig(SecondPageRouter.name,
              path: 'secondPage',
              parent: HomeRoute.name,
              children: [
                _i5.RouteConfig('*#redirect',
                    path: '*',
                    parent: SecondPageRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i5.RouteConfig(ThirdPageRouter.name,
              path: 'thirdPage',
              parent: HomeRoute.name,
              children: [
                _i5.RouteConfig('*#redirect',
                    path: '*',
                    parent: ThirdPageRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i6.Key? key, List<_i5.PageRouteInfo>? children})
      : super(HomeRoute.name,
            path: '/',
            args: HomeRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.FirstPage]
class FirstPageRouter extends _i5.PageRouteInfo<void> {
  const FirstPageRouter({List<_i5.PageRouteInfo>? children})
      : super(FirstPageRouter.name,
            path: 'firstPage', initialChildren: children);

  static const String name = 'FirstPageRouter';
}

/// generated route for
/// [_i3.SecondPage]
class SecondPageRouter extends _i5.PageRouteInfo<void> {
  const SecondPageRouter({List<_i5.PageRouteInfo>? children})
      : super(SecondPageRouter.name,
            path: 'secondPage', initialChildren: children);

  static const String name = 'SecondPageRouter';
}

/// generated route for
/// [_i4.ThirdPage]
class ThirdPageRouter extends _i5.PageRouteInfo<void> {
  const ThirdPageRouter({List<_i5.PageRouteInfo>? children})
      : super(ThirdPageRouter.name,
            path: 'thirdPage', initialChildren: children);

  static const String name = 'ThirdPageRouter';
}
