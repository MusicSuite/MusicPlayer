// Openapi Generator last run: : 2024-01-27T22:36:35.597717
import 'package:client/src/common.dart';
import 'package:client/src/view/player_view.dart';
import 'package:client/src/view/queue_view.dart';
import 'package:client/src/utils/websocket_manager.dart';
import 'package:client/src/view/song_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_server_api/music_server_api.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

import 'view/library_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
@Openapi(
  additionalProperties: DioProperties(
    pubName: 'music_server_api',
    useEnumExtension: true,
  ),
  inputSpec: InputSpec(path: "../server/data/openapi.json"),
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  outputDirectory: 'api/music_server_api',
)
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  final MusicServerApi api = MusicServerApi(basePathOverride: httpServerURL);
  final WebSocketManager webSocketManager = WebSocketManager();

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SongEditView.routeName:
                    return SongEditView(api: api);
                  case QueueView.routeName:
                    return QueueView(
                        api: api, webSocketManager: webSocketManager);
                  case LibraryView.routeName:
                    return LibraryView(
                        api: api, webSocketManager: webSocketManager);
                  case PlayerView.routeName:
                  default:
                    return PlayerView(
                        api: api, webSocketManager: webSocketManager);
                }
              },
            );
          },

          home: AppHomePage(api: api, webSocketManager: webSocketManager),
        );
      },
    );
  }
}

class AppHomePage extends StatefulWidget {
  const AppHomePage({
    super.key,
    required this.api,
    required this.webSocketManager,
  });

  final MusicServerApi api;
  final WebSocketManager webSocketManager;

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    PlayerView(api: widget.api, webSocketManager: widget.webSocketManager),
    QueueView(api: widget.api, webSocketManager: widget.webSocketManager),
    LibraryView(api: widget.api, webSocketManager: widget.webSocketManager),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.lightBlueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            label: PlayerView.titleName,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
            label: QueueView.titleName,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: LibraryView.titleName,
          ),
        ],
      ),
    );
  }
}
