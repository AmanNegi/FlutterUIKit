# Flutter 30 days challenge (UI Kit)

<a href="https://www.buymeacoffee.com/asterjoules" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important; width: 174px !important; box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important; -webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important; " ></a>

> version 1.0.0

Flutter 30 days challenge is a app build during the #30daysofflutterchallenge. It contains of several demo UI's which I took as challenge for particular date. You can the code for each page in this repository.

> ### Pages/Screenshots of the application 

| | | |
|:-------------------------:|:-------------------------:|:-------------------------:|
|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/login_page.png">Login Page |  <img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/signup_page.png">Sign Up Page|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/auth_page.png">Auth Page |
|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/chair_home_page.png">Chair Home Page  |  <img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/sliver_page.png">Sliver Page|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/categories_page.png">Categories Page|
|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/search_page.png">Search Page  | <img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/progress_page.png">Progress Page |<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/explore_books_page.png">Explore Books Page |
|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/adventure_page.png">Adventure Page |  <img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/stepper_page.png">Stepper Page|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/plant_page.png">Plant Page|
|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/ticket_page.png">Ticket Page  |  <img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/sushi_page.png">Sushi Page|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/furniture_page.png">Furniture Page|
|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/furniture_detail_page.png">Furniture Detail Page | <img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/settings_page.png">Settings Page |<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/trip_page.png">Trip Page |
|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/motivation_page.png">Motivation Page |  <img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/hydration_page.png">Hydration Page|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/property_page.png">Property Page|
|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/home_page.png">Home Page|<img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/navigator_page.png">[Navigator Page](https://github.com/AmanNegi/flutter_30_days/blob/main/lib/pages/navigator_page.dart) | <img width="1604"  src="https://github.com/AmanNegi/flutter_30_days/blob/main/screenshots/navigator_easy_view.png">Navigator Easy View |

## Topics Covered

* **Gesture Detector** : Gesture Detector has been used to detect horizontal drags to navigate across screens.

* **Custom Painter & Clipper** : To acheive custom layout and shapes custom clippers and painters are used.

* **Animations and Delayed Animation** : Complex and abstract animations are created using Intervals and AnimationController. Find the code [here}(https://github.com/AmanNegi/flutter_30_days/blob/main/lib/pages/welcome_page.dart).

* **Shared Prefrences**<br/>

Shared prefrences is used to save local user data. eg: User firebase id.

* **Firebase Auth**</br>

For users to login and signUp we have used firebase Auth.


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

2. Run the project by running command:

``` 

flutter run
```

3. Use one of these commands to build the project:

``` 

flutter build ios
flutter build apk
flutter build appbundle
```

4. If any issue (run the below command to troubleshoot):

``` 

flutter doctor
```

For help getting started with Flutter, check [online documentation](https://flutter.dev/docs), which offers great tutorials, samples, guidance on mobile development, and a full API reference. If you run into any issue or question, feel free to reach out to us via email asterjoules@gmail.com.

### Flutter packages used in flutter_30_days:

*  google_fonts
*  feature_discovery
*  mdi
*  url_launcher

## Authors

> [**Aman Negi(Aster Joules)**](https://github.com/AmanNegi) - *Initial work*

## Feel Free to Contract

* Gmail : asterjoules@gmail.com
