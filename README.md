# marvel_test

DD360 Test Project.

## SDK
- Flutter 3.10.5
- Dart 3.0.5

## How to run the project
- Create file named 'keys.env' at project root
- Add marvel public and private keys as follows:
  - PUBLIC_KEY='value'
  - PRIVATE_KEY='value'

- Execute the following commands:
  - flutter pub get
  - Check Flutter Intl is initialized 
  - dart run build_runner build --delete-conflicting-outputs
  - Run in debug or non-debug mode