import 'package:auto_route/auto_route.dart';
import 'package:bms_app/routes/di.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'core/resources/theme_data.dart';
import 'routes/router.dart';
import 'core/utils/constant.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ConsumerState createState() => ApplicationState();
}

// final analyticsProvider = Provider((ref) => FirebaseAnalytics.instance); //di injection

class ApplicationState extends ConsumerState<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _router = ref.watch(routerProvider);
    return MaterialApp.router(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      title: kAppName,
      routerDelegate: AutoRouterDelegate(
        _router,
        navigatorObservers: () => [
          MyRouteObserver(),
          SentryNavigatorObserver(),
          // FirebaseAnalyticsObserver(analytics: ref.watch(analyticsProvider)),
        ],
      ),
      routeInformationParser: _router.defaultRouteParser(),
      locale: DevicePreview.locale(context),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      theme: appTheme(context),
    );
  }
}

// A Counter example implemented with riverpod with Logger

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {
    print('''
╔
  "provider": "${provider.name ?? provider.runtimeType}",
╝
''');
  }
}
// "newValue": "$newValue"