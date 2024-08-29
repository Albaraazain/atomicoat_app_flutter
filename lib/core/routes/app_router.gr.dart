// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../features/error_detection/presentation/error_detection_page.dart'
    as _i7;
import '../../features/handbook/presentation/handbook_page.dart' as _i6;
import '../../features/monitoring/presentation/monitoring_page.dart' as _i3;
import '../../features/recipe/presentation/pages/recipe_page.dart' as _i2;
import '../../features/reservation/presentation/reservation.dart' as _i5;
import '../../features/system/presentation/pages/system_page.dart' as _i1;
import '../../features/troubleshooting/presentation/troubleshooting.dart'
    as _i4;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SystemRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SystemPage(),
      );
    },
    RecipeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RecipePage(),
      );
    },
    MonitoringRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MonitoringPage(),
      );
    },
    TroubleshootingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TroubleshootingPage(),
      );
    },
    ReservationRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ReservationPage(),
      );
    },
    HandbookRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HandbookPage(),
      );
    },
    ErrorDetectionRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ErrorDetectionPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SystemRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          RecipeRoute.name,
          path: '/recipe-page',
        ),
        _i8.RouteConfig(
          MonitoringRoute.name,
          path: '/monitoring-page',
        ),
        _i8.RouteConfig(
          TroubleshootingRoute.name,
          path: '/troubleshooting-page',
        ),
        _i8.RouteConfig(
          ReservationRoute.name,
          path: '/reservation-page',
        ),
        _i8.RouteConfig(
          HandbookRoute.name,
          path: '/handbook-page',
        ),
        _i8.RouteConfig(
          ErrorDetectionRoute.name,
          path: '/error-detection-page',
        ),
      ];
}

/// generated route for
/// [_i1.SystemPage]
class SystemRoute extends _i8.PageRouteInfo<void> {
  const SystemRoute()
      : super(
          SystemRoute.name,
          path: '/',
        );

  static const String name = 'SystemRoute';
}

/// generated route for
/// [_i2.RecipePage]
class RecipeRoute extends _i8.PageRouteInfo<void> {
  const RecipeRoute()
      : super(
          RecipeRoute.name,
          path: '/recipe-page',
        );

  static const String name = 'RecipeRoute';
}

/// generated route for
/// [_i3.MonitoringPage]
class MonitoringRoute extends _i8.PageRouteInfo<void> {
  const MonitoringRoute()
      : super(
          MonitoringRoute.name,
          path: '/monitoring-page',
        );

  static const String name = 'MonitoringRoute';
}

/// generated route for
/// [_i4.TroubleshootingPage]
class TroubleshootingRoute extends _i8.PageRouteInfo<void> {
  const TroubleshootingRoute()
      : super(
          TroubleshootingRoute.name,
          path: '/troubleshooting-page',
        );

  static const String name = 'TroubleshootingRoute';
}

/// generated route for
/// [_i5.ReservationPage]
class ReservationRoute extends _i8.PageRouteInfo<void> {
  const ReservationRoute()
      : super(
          ReservationRoute.name,
          path: '/reservation-page',
        );

  static const String name = 'ReservationRoute';
}

/// generated route for
/// [_i6.HandbookPage]
class HandbookRoute extends _i8.PageRouteInfo<void> {
  const HandbookRoute()
      : super(
          HandbookRoute.name,
          path: '/handbook-page',
        );

  static const String name = 'HandbookRoute';
}

/// generated route for
/// [_i7.ErrorDetectionPage]
class ErrorDetectionRoute extends _i8.PageRouteInfo<void> {
  const ErrorDetectionRoute()
      : super(
          ErrorDetectionRoute.name,
          path: '/error-detection-page',
        );

  static const String name = 'ErrorDetectionRoute';
}
