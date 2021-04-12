# Flutter 30 days challenge (UI Kit)

<a href="https://www.buymeacoffee.com/asterjoules" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

> version 1.0.0

Flutter 30 days challenge is a app build during the #30daysofflutterchallenge. It contains of several demo UI's which I took as challenge for particular date. You can the code for each page in this repository.

### App Screens

* Welcome Screen
* Navigator Page
* Signup Page
* Login Page
* Settings Page
* Adventure Page
* Category Page
* Chair Home Page
* Explore Page
* Furniture Detail Page
* Furniture Page
* Home Page

>### Pages/Screenshots of the application 

| | | |
|:-------------------------:|:-------------------------:|:-------------------------:|
|<img width="1604" alt="screen shot 2017-08-07 at 12 18 15 pm" src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/navigator_page.png"> [Navigator Page](https://github.com/AmanNegi/flutter_30_days/blob/main/lib/pages/chair_home_page.dart) | <img width="1604" alt="screen shot 2017-08-07 at 12 18 15 pm" src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/navigator_easy_view.png"> Navigator Easy View |<img width="1604" alt="screen shot 2017-08-07 at 12 18 15 pm" src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/auth_page.png"> Auth Page |
|<img width="1604" alt="screen shot 2017-08-07 at 12 18 15 pm" src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/login_page.png"> Login Page |  <img width="1604" alt="screen shot 2017-08-07 at 12 18 15 pm" src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/signup_page.png">Sign Up Page|<img width="1604" alt="screen shot 2017-08-07 at 12 18 15 pm" src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/home_page.png">Home Page|
|<img width="1604" alt="screen shot 2017-08-07 at 12 18 15 pm" src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/chair_home_page.png">Chair Home Page  |  <img width="1604" alt="screen shot 2017-08-07 at 12 18 15 pm" src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/sliver_page.png">Sliver Page|<img width="1604" alt="screen shot 2017-08-07 at 12 18 15 pm" src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/categories_page.png">Categories Page|

## Topics Covered

* **Firebase Cloud Firestore** : Users data, profile image etc is received and stored in the firestore. The messages are also saved there.

* **Messaging through firebase**</br>

The app implements messaging feature as a side feature to help the users communicate.

* **Shared Prefrences**<br/>

Shared prefrences is used to save local user data. eg: User firebase id.

* **Firebase Auth**</br>

For users to login and signUp we have used firebase Auth.

* **Theme settings**</br>

The app provides a number of theme changing options from mainColor to primary font and dark and light Mode.

### Project Structure

``` 
...
   ├── pages/auth/   #This folder contains auth related files.
   ├── dialogs/   # This folder contains dialogs used in the app.
   ├── helper/   # This folder contains helper methods and classes.
   ├── pages/   # This folder contains all the pages.
   ├── painter/   # This folder contains the custom painter classes.
   ├── layout/   #This folder layout related pages.
   ├── bottomSheet/ # Contains all the bottom sheets used in the app.
   ├── route_generator # Contains all the routes used in the app.
   ├── globals.dart   # Contains all globally used variables. 
   └── main.dart   # Root file of the project
```

## Project Setup

In order to set up the project, please follow below steps:

### Flutter setup

1. Install package dependencies:

``` 
flutter pub get
```

2. Go to google firebase and create your own project and extract the googleservices.json.

3. Run the project by running command:

``` 
flutter run
```

4. Use one of these commands to build the project:

``` 
flutter build ios
flutter build apk
flutter build appbundle
```

5. If any issue (run the below command to troubleshoot):

``` 
flutter doctor
```

For help getting started with Flutter, check [online documentation](https://flutter.dev/docs), which offers great tutorials, samples, guidance on mobile development, and a full API reference. If you run into any issue or question, feel free to reach out to us via email asterjoules@gmail.com.

### Flutter packages used in flutter_30_days:

*  google_fonts
*  flutter_svg
*  mdi
*  url_launcher

## Authors

> [**Aman Negi(Aster Joules)**](https://github.com/AmanNegi) - *Initial work*

## Feel Free to Contract

* Gmail : akuro787898@gmail.com
