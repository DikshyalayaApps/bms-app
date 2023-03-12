
# *** Readme is under construction ***

<p align="center" width="100%">
  <br>
  <a href="https://github.com/dikshyalaya/bms-app.git"><img src="assets/images/app_logo.png" alt="BMS Logo"></a>
  <br>
  <h1>
  🤖 BMS Mobile Application 🤖
  </h1>
  <br>
</p>

![](https://img.shields.io/github/last-commit/tortuvshin/open-source-flutter-apps.svg?label=last%20update&style=flat)

A BMS app created in flutter using Provider. clone the appropriate branches mentioned below:

* Mobile: https://github.com/dikshyalaya/bms-app.git (master channel)

## Getting Started

The BMS contains the minimal implementation required to create a new library or app. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new app. By using boiler plate code as standard initializer, we can have same patterns in all the apps that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.


## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/dikshyalaya/bms-app.git
```

**Step 2:**

Go to app root and execute the following command in console to get the required dependencies:

```
flutter pub get
```

**Step 3:**

This app uses `freezed` library that works with code generation, execute the following command to generate files only if you get some error related to freezed otherwise you are good to go:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Hide Generated Files (*Optional)

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.network_exceptions.freezed.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.network_exceptions.freezed.dart
**/*.g.dart (if serializable package is used)
```

## BMS Features:

* Splash
* Login
* Home
* Routing [2.0]
* Theme
* Dio (with auth interceptor)
* Database (hive)
* Riverpod with hooks (State Management)
* Validation
* Code Generation (Freezed)
* User Notifications (FCM)
* Logging
* Dependency Injection with Riverpod

### Up-Coming Features:

* Connectivity Check Support

## Changes Log:
### 1.0.0
* Basic authentication flow

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the BMS then please feel free to submit an issue and/or pull request 🙂

Again to note, this is not a best and final version, you are always invited to edit and suggest changes, please make pull request to make changes this readme.

Author:
    Nabraj Khadka
    Dikshyalaya, Kathmandu, Nepal

Developer resources Info:


