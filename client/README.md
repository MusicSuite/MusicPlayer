# client

A new Flutter project.

## Commands

generate_api.bat is for generating the API, however it doesn't look like it really creates the types
Also, yaml might not be needed, but maybe useful to have regardless, or at least archive the code
So maybe use the old command as inspiration, but do use the npm to generate it
command it seems to use:

```commandline
generate -o=api/music_server_api -i=./openapi.json -g=dart-dio
```

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
