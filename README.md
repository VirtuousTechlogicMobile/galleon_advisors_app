# galleon_user

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Boilerplate Features:

* Splash
* Login
* Home
* Routing
* Theme
* Database
* Get-x

### Up-Coming Features:


### Libraries & Tools Used

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- common/
|- constant/
|- helper/
|- modules/
|- routs/
|- services/
|- theme/
|- utility/
|- main.dart
|- firebase_options.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
- common - Contains the common widgets for your applications. For example, Button, TextField etc.
- constant - Contains the constant widgets for your applications. For assets, colors, dimens, constant_values, enums, styles etc.
- helper - Contains the helper for your application. For database_helper (database query, synonyms, database error message, database response model).
         - Contains the helper for your application. For storage_handler (store data local (Get Storage) query, storage getter setter methods, synonyms).
         - Contains the exeptions handler your application. For custom_exeptions_handler (exeptions message ex. No internet connection available, etc.) exeptions throw.
- modules - Contains the modules your application. For your application all modules flow ( Model-View-Controller (MVC)) is one widely used architectural pattern.
- routes.dart - This file contains all the routes for your application.
- services - Contains the services your application. For your application language translation key value etc.
- theme - Contains the theme of your app. For Your application theme (Color, style, ) etc.
- utility - Contains the utility of your app. For Your application role permission, Common ( widget, values, string, log, progress, method, functions) etc.
- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```
### common

This directory contains all the application level common. A separate file is created for each type as shown in example below:

```
common/
|- activity_dropdown.dart
|- common_icon_button.dart
|- common_validation.dart
|- common_widgets.dart
|- custom_checkbox.dart
|- custom_drop_down.dart
|- custom_drop_down_button.dart
|- custom_dropdown_new.dart
|- custom_primary_button.dart
|- custom_split_slider.dart
|- custom_text_field.dart
|- delete_component.dart
|- help_dialog.dart
|- multi_select_custom_drop_down.dart
|- no_data_widget.dart
|- percentage_progress.dart
|- profile_component.dart
|- share_component.dart
|- slider_border.dart
|- textfield_with_label.dart
|- verified_email.dart

```
### constant

This directory contains all the application level constant. A separate file is created for each type as shown in example below:

```
constant/
|- app_states.dart
|- assets.dart
|- colors.dart
|- constant_values.dart
|- dimens.dart
|- enums.dart
|- strings.dart
|- styles.dart

```
### helper

All the database queries of your application will go into this directory, it represents the data layer of your application. It is subdivided into three directories `database_helper`, `database_synonyms`, and `firebase_error_messages`, each containing queries, synonyms, and error messages.
All the local stores of your application will go into this directory, it represents the data layer of your application. It is subdivided into three directories `storage_data_handler`, `storage_getters_setters`, and `storage_synonyms`, each containing local stores, synonyms, and getter setter methods.

```
helper/
|- database_helper/
   |- database_helper.dart
   |- database_synonyms.dart
   |- firebase_error_messages.dart
   |- firebase_response_model.dart
|- storage_handler/
   |- storage_data_handler.dart
   |- storage_getters_setters.dart
   |- storage_synonyms.dart
|- local_database_helper/
   |- database_helper.dart
   |- database_synonyms.dart
   |- firebase_error_messages.dart
   |- firebase_response_model.dart
```

### modules

```
create_new_study/
|- bindings/
   |- create_new_study_binding.dart
|- component/
   |- new_study_appbar.dart
|- controller/
   |- create_new_study_controller.dart
|- model/
   |- department_data_model.dart
   |- opportunity_flag_data_model.dart
   |- study_data_model.dart
   |- study_task_timeline_data_model.dart
|- view/
   |- create_new_study_screen.dart

```

### routes
This file contains all the routes for your application.
```
routes/
  |- app_pages.dart
  |- app_routes.dart
  |- route_management.dart
    
```

### services
```
services/
|- translations/
    |- en_US
        |- en_us_translations.dart
    |- app_translations.dart
```
### theme

``` 
theme/
|- theme_controller.dart

```

### utility

```
utility/
|- role_permission.dart
|- utility.dart

```


### App Themes Style Specification

```
  style12Normal, // labelSmall
  style13Normal, // displaySmall 
  style14SemiBold, // bodyMedium
  style14Normal, // bodysmall
  style16Bold, // titleLarge
  style16Normal, // title small
  style16SemiBold, // title medium
  style18Bold, // labelLarge
  style18Normal, // labelMedium
  style19Normal, // headlineSmall
  style20Bold, // headlineMedium
  style20Normal, // displayMedium
  style24Bold, // displayLarge
  style28Bold, // bodyLarge
  style32Bold, // headlineLarge

```

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂
