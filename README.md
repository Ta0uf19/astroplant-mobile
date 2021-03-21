# Astroplant mobile application

### Libraries & Tools Used
* [Dio](https://github.com/flutterchina/dio)
* [Dependency Injection](https://github.com/fluttercommunity/get_it)
* [URI](https://github.com/google/uri.dart)
* [json_serializable](https://github.com/google/json_serializable.dart)
* [FL Chart](https://github.com/imaNNeoFighT/fl_chart)

### Project structure
Here is the folder structure we have been using in this project

```
lib/
|- data/
|- di/
|- models/
|- stores/
|- ui/
	|- widgets/
	|- components/
	|- screens/
|- utils/
|- main.dart
|- routes.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- data —  Contains the data layer of the project, includes directories for local, api and repository
2- di —  Dependency injection
3- models —  Contains the data layer of your project
4- stores —  Contains stores for state-management of our application, to connect the reactive data with the UI.
5- ui  —  Contains all the ui of your project
	- widgets - Contains the common widgets for your applications. For example, Button, TextField etc.
	- components - Specific components to the application build with custom widgets
	- screens - Pages of the application, each screen is located in a separate folder making it easy to combine group of files related to that particular screen. 
6- util  —  Contains the utilities/common functions of your application.
7- routes.dart - This file contains all the routes for your application.
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```
