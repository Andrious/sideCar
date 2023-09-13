///
import '../../view.dart';

/// App
class SideCarApp extends AppStatefulWidget {
  SideCarApp({super.key});
  // This is the 'App State object' of the application.
  @override
  AppState createAppState() => _SideCarAppState();
}

/// This is the 'View' of the application.
/// The 'look and behavior' of the app.
///
class _SideCarAppState extends AppState {
  _SideCarAppState()
      : super(
          home: const SideCarHome(), //const SettingsPage(),
          inTitle: () => 'Demo App',
          debugShowCheckedModeBanner: false,
          useRouterConfig: false,
          useMaterial: true,
          theme: ThemeData(
//            scaffoldBackgroundColor: const Color(0x007e827b),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Colors.white,
              ),
              bodySmall: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          localizationsDelegates: [
            L10n.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          allowChangeLocale: true, // Allow the app to change locale
          allowChangeUI: true, // Allow the app to change its design interface
          inInitAsync: () => Future.value(true), // Merely a test.
          inInitState: () {/* Optional inInitState() function */},
        );
}
