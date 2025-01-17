import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:star_book/screens/home_page.dart';
// Files
import './routes/route_generator.dart';
import './models/activity.dart';
import './models/mood.dart';

/// Starting point of the application.
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Activity>(ActivityAdapter());
  Hive.registerAdapter<Mood>(MoodAdapter());
  await Hive.openBox<Activity>(activityBoxName);
  runApp(MyApp());
}

/// MyApp is the most Parent widget and initialises the main route.
///
/// [HomePage] initial route
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoApp(
      initialRoute: '/',
      title: "StarBook",
      theme: c.CupertinoThemeData(),
      onGenerateRoute: (settings) => RouteGenerator.mainRoute(settings),
       // home:HomePage(),
    );

}
  }

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return c.CupertinoTabScaffold(tabBar: c.CupertinoTabBar(items: [
      BottomNavigationBarItem(
        icon: Icon (c.CupertinoIcons.home),
        
        
      ),
      BottomNavigationBarItem(
        icon: Icon (c.CupertinoIcons.profile_circled),

      ),
    ],
    ),
    tabBuilder: (context,i){
      
    }
    );
  }
}


class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  }
}
  

