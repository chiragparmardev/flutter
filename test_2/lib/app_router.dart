import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  RouteType get DefaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: HomeScreenRoute.page, path: '/'),
        AutoRoute(page: AddEditCourseScreenRoute.page)
      ];
}
