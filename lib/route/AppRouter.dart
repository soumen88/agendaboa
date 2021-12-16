import 'package:agendaboa/ui/first_page.dart';
import 'package:agendaboa/ui/home.dart';
import 'package:agendaboa/ui/second_page.dart';
import 'package:agendaboa/ui/third_page.dart';
import 'package:auto_route/auto_route.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: HomePage, children: [
      AutoRoute(
        path: 'posts',
        name: 'PostsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: FirstPage,
          ),
          AutoRoute(
            path: ':postId',
            page: SecondPage,
          )
        ],
      ),
      AutoRoute(
        path: 'posts',
        name: 'UsersRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: FirstPage,
          ),
          AutoRoute(
            path: ':postId',
            page: SecondPage,
          ),
        ],
      ),
    ]),
  ],
)
class $AppRouter {}
