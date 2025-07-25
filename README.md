# Starter application

Application with base architecture to start developing new flutter projects.

#### Application support:
- Multi languages.
- Internet connection.
- Many widgets that are ready to use (Like dialogs ..).

#### Some packages should know:
##### To be familiar with this code you should check these packages:
- [Injectable] (Dependency injection).
- [Super enum] (Used at most with the bloc for events and states).
- [Bloc] and [provider] (State management).
- Other important packages you can see in pubspec.yaml.

We use some packages dependent on code generating so before you start (for check), run:
``` 
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
```
``` 
dart run build_runner build --delete-conflicting-outputs
```

Also, before you start, if localization generated files are changed or don't exist. run:
``` 
flutter pub run intl_utils:generate
```

We are using [ScreenUtil] for building responsive app. Use this guide to know which extension you need to use:
- sp
   - icons size and texts size
- w
   - for width
- h
   - for height
- r
   - for borderRadius or EdgeInsets.all() or any widget that is in circle shape or square because 50.h != 50.w so we use 50.r
- sw
   - screen width
- sh
   - screen height

## Examples
```dart
EdgeInsets.all(8).r,

EdgeInsets.symmetric(
   vertical: 12.h,
   horizontal: 15.w,
),

BorderRadius.circular(16).r,

Icon(
   Icons.check,
   size: 20.sp,
),

Text(
   "Example",
   style: TextStyle(
      fontSize: 16.sp,
   ),
),

/// Normal Widgets
Container(
   width: 300.w,
   height: 100.h,
),

///// Square/Circle Widgets /////

/// Square/Circle based on Height
Container(
   width: 150.h,
   height: 150.h,
),

/// Square/Circle based on Width
Container(
   width: 150.w,
   height: 150.w,
),

/// Square/Circle based on minimum(height, width)
Container(
   width: 150.r,
   height: 150.r,
),
```

to remove a folder from git
```
git rm -r --cached .dart_tool/
git clean -f to clean untracked
git clean -xfd && git fetch
git rm -r --cached README.md
```

Install FVM:
```
flutter pub global activate fvm
List available Flutter versions and install the required version:
fvm install 3.24.3
Use the installed Flutter version and run flutter pub get:
fvm use 3.24.3
flutter pub get
These steps will set up and use the correct Flutter SDK version (3.22.2) with FVM, allowing you to resolve version conflicts in your Flutter project.
```

