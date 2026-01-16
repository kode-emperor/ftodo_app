# Flutter MVVM Project Structure Creator
# Run this script from your project's root directory

Write-Host "Creating Flutter MVVM with Provider project structure..." -ForegroundColor Green

# Define the folder structure
$folders = @(
    "lib",
    "lib\core",
    "lib\core\constants",
    "lib\core\utils",
    "lib\features",
    "lib\features\todo",
    "lib\features\todo\data",
    "lib\features\todo\data\models",
    "lib\features\todo\data\repositories",
    "lib\features\todo\domain",
    "lib\features\todo\domain\entities",
    "lib\features\todo\presentation",
    "lib\features\todo\presentation\view_models",
    "lib\features\todo\presentation\views",
    "lib\features\todo\presentation\widgets",
    "lib\features\todo\presentation\providers",
    "lib\shared",
    "lib\shared\widgets"
)

# Define files to create
$files = @(
    "lib\main.dart",
    "lib\core\constants\app_constants.dart",
    "lib\core\utils\extensions.dart",
    "lib\features\todo\data\models\todo_model.dart",
    "lib\features\todo\data\repositories\todo_repository.dart",
    "lib\features\todo\domain\entities\todo_entity.dart",
    "lib\features\todo\presentation\view_models\todo_viewmodel.dart",
    "lib\features\todo\presentation\views\todo_screen.dart",
    "lib\features\todo\presentation\widgets\todo_list_item.dart",
    "lib\features\todo\presentation\widgets\add_todo_dialog.dart",
    "lib\features\todo\presentation\providers\todo_provider.dart",
    "lib\shared\widgets\custom_button.dart"
)

# Create folders
Write-Host "Creating directories..." -ForegroundColor Cyan
foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Host "  Created: $folder" -ForegroundColor Yellow
    } else {
        Write-Host "  Exists: $folder" -ForegroundColor Gray
    }
}

# Create empty files
Write-Host "`nCreating files..." -ForegroundColor Cyan
foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        New-Item -ItemType File -Path $file -Force | Out-Null
        Write-Host "  Created: $file" -ForegroundColor Green
    } else {
        Write-Host "  Exists: $file" -ForegroundColor Gray
    }
}

# Create pubspec.yaml if it doesn't exist
if (-not (Test-Path "pubspec.yaml")) {
    @"
name: flutter_mvvm_provider
description: A Flutter MVVM project with Provider
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.0
  equatable: ^2.0.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true
"@ | Out-File -FilePath "pubspec.yaml" -Encoding UTF8
    Write-Host "  Created: pubspec.yaml" -ForegroundColor Green
}

# Create analysis_options.yaml for linting
if (-not (Test-Path "analysis_options.yaml")) {
    @"
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    prefer_const_constructors: true
    prefer_const_literals_to_create_immutables: true
    avoid_print: false
"@ | Out-File -FilePath "analysis_options.yaml" -Encoding UTF8
    Write-Host "  Created: analysis_options.yaml" -ForegroundColor Green
}

# Create .gitignore if it doesn't exist
if (-not (Test-Path ".gitignore")) {
    @"
# Flutter/Dart
.dart_tool/
.packages
.pub-cache/
.pub/
build/
.flutter-plugins
.flutter-plugins-dependencies
.fvm/

# Android
android/**/gradle-wrapper.jar
android/.gradle/
android/captures/
android/gradlew
android/gradlew.bat
android/local.properties
android/key.properties
android/**/GeneratedPluginRegistrant.java
android/**/*.class

# iOS
ios/**/*.mode1v3
ios/**/*.mode2v3
ios/**/*.moved-aside
ios/**/*.pbxuser
ios/**/*.perspectivev3
ios/**/*sync/
ios/**/.sconsign.dblite
ios/**/.tags*
ios/**/.vagrant/
ios/**/DerivedData/
ios/**/Icon?
ios/**/Pods/
ios/**/.symlinks/
ios/**/profile
ios/**/xcuserdata
ios/.generated/
ios/Flutter/App.framework
ios/Flutter/Flutter.framework
ios/Flutter/Flutter.podspec
ios/Flutter/Generated.xcconfig
ios/Flutter/ephemeral/
ios/Flutter/app.flx
ios/Flutter/app.zip
ios/Flutter/flutter_assets/
ios/Flutter/flutter_export_environment.sh
ios/ServiceDefinitions.json
ios/Runner/GeneratedPluginRegistrant.*

# Test coverage
coverage/

# VS Code
.vscode/
!.vscode/settings.json
!.vscode/launch.json
!.vscode/tasks.json

# IntelliJ
.idea/
*.iml
*.iws
*.ipr

# macOS
.DS_Store

# Windows
Thumbs.db
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8
    Write-Host "  Created: .gitignore" -ForegroundColor Green
}

Write-Host "`nProject structure created successfully!" -ForegroundColor Green
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Run 'flutter pub get' to install dependencies" -ForegroundColor Yellow
Write-Host "2. Copy the provided code into the respective files" -ForegroundColor Yellow
Write-Host "3. Run 'flutter run' to start the app" -ForegroundColor Yellow
Write-Host "`nProject structure summary:" -ForegroundColor Cyan
Get-ChildItem -Path "lib" -Recurse -Directory | ForEach-Object {
    $indent = "  " * ($_.FullName.Split("\").Length - 1)
    Write-Host "$indent📁 $($_.Name)" -ForegroundColor Blue
}

Get-ChildItem -Path "lib" -Recurse -File | ForEach-Object {
    $indent = "  " * ($_.FullName.Split("\").Length - 1)
    Write-Host "$indent📄 $($_.Name)" -ForegroundColor White
}