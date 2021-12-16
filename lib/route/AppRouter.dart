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
        path: 'firstPage',
        name: 'firstPageRouter',
        page: FirstPage,
        children: [
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: 'secondPage',
        name: 'secondPageRouter',
        page: SecondPage,
        children: [
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        path: 'thirdPage',
        name: 'thirdPageRouter',
        page: ThirdPage,
        children: [
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
    ]),
  ],
)
class $AppRouter {}
