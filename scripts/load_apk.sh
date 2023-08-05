adb uninstall com.aster.flutter_30_days
flutter clean 
flutter build apk --release
# Go to root folder
cd build/outputs/flutter-apk
# Load apk
adb install app-release.apk