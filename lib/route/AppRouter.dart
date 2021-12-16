import 'package:agendaboa/ui/first_page.dart';
import 'package:agendaboa/ui/second_page.dart';
import 'package:agendaboa/ui/third_page.dart';
import 'package:auto_route/auto_route.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'first',
      name: "counterRouter",
      initial: true,
      page: FirstPage,
      children: [
        AutoRoute(
          path: '',
          page: SecondPage,
        ),
        AutoRoute(
          path: '',
          page: ThirdPage,
        )
      ],
    ),
  ],
)

class $AppRouter{

}