import 'package:auto_route/annotations.dart';

import 'presentation/pages/home_page.dart';
import 'presentation/pages/init_page.dart';
import 'presentation/pages/profile_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitPage, initial: true),
    AutoRoute(path: "/home", page: HomePage),
    AutoRoute(path: "/profile", page: ProfilePage),
  ],
)
class $AppRouter {}
