// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../ui/first_page.dart' as _i1;
import '../ui/second_page.dart' as _i2;
import '../ui/third_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CounterRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.FirstPage());
    },
    SecondRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SecondPage());
    },
    ThirdRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ThirdPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: 'first', fullMatch: true),
        _i4.RouteConfig(CounterRouter.name, path: 'first', children: [
          _i4.RouteConfig(SecondRoute.name,
              path: '', parent: CounterRouter.name),
          _i4.RouteConfig(ThirdRoute.name, path: '', parent: CounterRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.FirstPage]
class CounterRouter extends _i4.PageRouteInfo<void> {
  const CounterRouter({List<_i4.PageRouteInfo>? children})
      : super(CounterRouter.name, path: 'first', initialChildren: children);

  static const String name = 'CounterRouter';
}

/// generated route for
/// [_i2.SecondPage]
class SecondRoute extends _i4.PageRouteInfo<void> {
  const SecondRoute() : super(SecondRoute.name, path: '');

  static const String name = 'SecondRoute';
}

/// generated route for
/// [_i3.ThirdPage]
class ThirdRoute extends _i4.PageRouteInfo<void> {
  const ThirdRoute() : super(ThirdRoute.name, path: '');

  static const String name = 'ThirdRoute';
}
