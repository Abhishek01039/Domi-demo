# Domi_demo

A Flutter project Demo with BottomSheet & Map.

## Project Setup & Run

### Clone project with below url

`git clone <--url-->`

### Execute below command to setup and run app

```
flutter clean
flutter pub get
flutter run
```

## Code/Folder Structure

```
- core
    - constants
    - models
    - provider
- ui
    - screens
    - widget
```

## Instruction to follow before run to load map

Replace map api key on android on this file "project/android/app/src/main/AndroidManifest.xml"

```
<meta-data android:name="com.google.android.geo.API_KEY"
android:value="<-- API KEY -->"/>
```

Replace map api key on ios on this file "project/ios/Runner/AppDelegate.swift"

```
GMSServices.provideAPIKey("<-- API KEY -->")
```
