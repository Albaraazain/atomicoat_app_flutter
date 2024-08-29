import 'package:auto_route/auto_route.dart';

import '../../features/error_detection/presentation/error_detection_page.dart';
import '../../features/handbook/presentation/handbook_page.dart';
import '../../features/monitoring/presentation/monitoring_page.dart';
import '../../features/recipe/presentation/pages/recipe_page.dart';
import '../../features/reservation/presentation/reservation.dart';
import '../../features/system/presentation/pages/system_page.dart';
import '../../features/troubleshooting/presentation/troubleshooting.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SystemPage, initial: true),
    AutoRoute(page: RecipePage),
    AutoRoute(page: MonitoringPage),
    AutoRoute(page: TroubleshootingPage),
    AutoRoute(page: ReservationPage),
    AutoRoute(page: HandbookPage),
    AutoRoute(page: ErrorDetectionPage),
  ],
)
class $AppRouter {}