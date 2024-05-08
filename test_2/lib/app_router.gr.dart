// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:test_2/screen/add_edit_course.dart' as _i1;
import 'package:test_2/screen/home.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AddEditCourseScreenRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddEditCourseScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddEditCourseScreen]
class AddEditCourseScreenRoute extends _i3.PageRouteInfo<void> {
  const AddEditCourseScreenRoute({List<_i3.PageRouteInfo>? children})
      : super(
          AddEditCourseScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddEditCourseScreenRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i3.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
