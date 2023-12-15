# todo_app_ios_mobile

This repository contains sample project created in testing purposes. It is a simple iOS application that allows user to create todo items and mark them as completed. It uses SwiftUI framework and MVVM architecture.

## Requirements

1. IDE: Xcode 13+, Visual Studio Code 1.61+, AppCode 2021.2+
1. iOS: iOS 16.4+

## Dependencies

This project does not use any third party libraries, this is pure Swift code, that uses only Swift standard library and Swift UI framework.

## Installation

Clone this repository to your local machine and open `TodoApp.xcodeproj` file or containing folder in your favorite IDE.

Visual Studio Code notice: you will not be able to run unit tests from IDE, because it does not support running tests for iOS projects. You can run tests from command line using `xcodebuild test` command.

## Building From Command Line

Run `xcodebuild` command from project root directory. This command will build project and run all unit tests.

Here is a command example:

```bash 
xcodebuild -project TodoApp.xcodeproj -scheme TodoApp -destination 'platform=iOS Simulator,name=iPhone 13,OS=16.4' build
```

If you want to get `ipa` file you would need to specify signing identity and provisioning profile:

```bash
xcodebuild -project TodoApp.xcodeproj -scheme TodoApp -destination 'platform=iOS Simulator,name=iPhone 13,OS=16.4' -configuration Release CODE_SIGN_IDENTITY="iPhone Developer" PROVISIONING_PROFILE="your provisioning profile" archive -archivePath build/TodoApp.xcarchive
```
Also you may need to specify DEVELOPMENT_TEAM if you have multiple teams in your account. And update Xcode project settings to use automatic signing.

## Running Tests From Command Line

Run `xcodebuild test` command from project root directory. This command will build project and run all unit tests.

For example:

```bash
xcodebuild -project TodoApp.xcodeproj -scheme TodoApp -destination 'platform=iOS Simulator,name=iPhone 13,OS=16.4' test
```

## License

Apache License 2.0