# Domi_demo

A Flutter project Demo with BottomSheet & Map.

## Project Setup & Run

### Clone project with the below URL

`git clone https://github.com/Abhishek01039/Domi-demo/tree/main`

### Execute the below command to set-up and run the app

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

## Instruction to follow before running to load the map

Replace the map API key on Android on this file "project/android/app/src/main/AndroidManifest.xml"

```
<meta-data android:name="com.google.android.geo.API_KEY"
android:value="<-- API KEY -->"/>
```

Replace map API key on ios on this file "project/ios/Runner/AppDelegate.swift"

```
GMSServices.provideAPIKey("<-- API KEY -->")
```

Proof 

- iOS

https://github.com/user-attachments/assets/967bbbec-2da9-4fd0-a010-74c2f7b29d95

- Android



https://github.com/user-attachments/assets/e69c1105-668f-4ef8-b148-f167d0a62012


