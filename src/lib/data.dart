import "package:flutter/material.dart";

import "pages/exports.dart";

class ButtonItem {
  String text;
  String route;

  ButtonItem(this.text, this.route);
}

List<ButtonItem> buttonList = [
  ButtonItem("Auth Page", AuthPage.route),
  ButtonItem("Login Page", LoginPage.route),
  ButtonItem("Sign Up Page", SignUpPage.route),
  ButtonItem("Home Page", HomePage.route),
  ButtonItem("Chair Home Page", ChairHomePage.route),
  ButtonItem("Sliver Page", SliverPage.route),
  ButtonItem("Category Page", CategoryPage.route),
  ButtonItem("Search Page", SearchPage.route),
  ButtonItem("Progress Page", ProgressPage.route),
  ButtonItem("Explore Books Page", ExplorePage.route),
  ButtonItem("Adventure Page", AdventurePage.route),
  ButtonItem("Stepper Page", StepperPage.route),
  ButtonItem("Plant Page", PlantPage.route),
  ButtonItem("Ticket Page", TicketPage.route),
  ButtonItem("Sushi Page", SushiHomePage.route),
  ButtonItem("Furniture Page", FurniturePage.route),
  ButtonItem("Furniture Detail Page", FurnitureDetailPage.route),
  ButtonItem("Settings Page", SettingsPage.route),
  ButtonItem("Trip Page", TripPage.route),
  ButtonItem("Motivation Page", MotivationPage.route),
  ButtonItem("Hydration Page", HydrationPage.route),
  ButtonItem("Property Page", PropertyPage.route),
];

class PageItem {
  Widget page;
  String routeName;

  PageItem(this.page, this.routeName);
}

List<PageItem> pageList = [
  PageItem(AuthPage(), AuthPage.route),
  PageItem(LoginPage(), LoginPage.route),
  PageItem(SignUpPage(), SignUpPage.route),
  PageItem(HomePage(), HomePage.route),
  PageItem(ChairHomePage(), ChairHomePage.route),
  PageItem(SliverPage(), SliverPage.route),
  PageItem(CategoryPage(), CategoryPage.route),
  PageItem(SearchPage(), SearchPage.route),
  PageItem(ProgressPage(), ProgressPage.route),
  PageItem(ExplorePage(), ExplorePage.route),
  PageItem(AdventurePage(), AdventurePage.route),
  PageItem(StepperPage(), StepperPage.route),
  PageItem(PlantPage(), PlantPage.route),
  PageItem(TicketPage(), TicketPage.route),
  PageItem(SushiHomePage(), SushiHomePage.route),
  PageItem(FurniturePage(), FurniturePage.route),
  PageItem(FurnitureDetailPage(), FurnitureDetailPage.route),
  PageItem(SettingsPage(), SettingsPage.route),
  PageItem(TripPage(), TripPage.route),
  PageItem(MotivationPage(), MotivationPage.route),
  PageItem(HydrationPage(), HydrationPage.route),
  PageItem(PropertyPage(), PropertyPage.route),
];
