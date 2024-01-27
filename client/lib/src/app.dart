// Openapi Generator last run: : 2024-01-27T20:45:20.539581
import 'package:client/src/common.dart';
import 'package:client/src/view/player_view.dart';
import 'package:client/src/view/song_queue_view.dart';
import 'package:client/src/utils/websocket_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_server_api/music_server_api.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

import 'view/song_edit_view.dart';
import 'view/song_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
@Openapi(
  additionalProperties: DioProperties(
    pubName: 'music_server_api',
    useEnumExtension: true,
  ),
  inputSpecFile: "",
  inputSpec: InputSpec(path: "../server/data/openapi.json", useYml: false),
  generatorName: Generator.dio,
  runSourceGenOnOutput: true,
  useNextGen: true,
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
                  case SongListView.routeName:
                  default:
                    // return PlayerView(
                    //     api: api, webSocketManager: webSocketManager);
                    return SongListView(
                        api: api, webSocketManager: webSocketManager);
                    // return SongQueueView(
                    //     api: api, webSocketManager: webSocketManager);
                    return SongEditView(api: api);
                }
              },
            );
          },
        );
      },
    );
  }
}
