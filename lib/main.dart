import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String? name;

//stateless widgets cannot change state
//?stateful widgets can change state

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int clientSelection = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text(name ?? "Cha Coding"),
        centerTitle: false,
        actions: [
          Text("Exit", style: TextStyle(fontSize: 18.0)),
          Icon(Icons.exit_to_app, size: 30.0),
        ],
      ),

      // drawer: SafeArea(
      //   child: Drawer(
      //     child: Column(
      //       children: [
      //         Container(
      //           height: 50.0,
      //           child: Center(
      //             child: Text(
      //               "Settings",
      //               style: TextStyle(fontSize: 20.0, color: Colors.white),
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: [
      //               ListTile(
      //                 title: Text("Log out"),
      //                 tileColor: Colors.red[300],
      //               ),
      //               ListTile(
      //                 title: Text("View details"),
      //                 tileColor: Colors.pink[300],
      //               ),
      //               ListTile(
      //                 title: Text("About this app"),
      //                 tileColor: Colors.teal[300],
      //               ),
      //               ListTile(
      //                 title: Text("Picture"),
      //                 tileColor: Colors.yellow[300],
      //                 splashColor: Colors.black,
      //               ),
      //               ListTile(title: Text("Video"), tileColor: Colors.blue[300]),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: clientSelection == 0
          ? Center(child: Text("This is page 1"))
          : clientSelection == 1
          ? Center(child: Text("This is page 2"))
          : Center(child: Text("This is page 3")),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.work), label: 'Work'),
          NavigationDestination(icon: Icon(Icons.work), label: 'Work'),
        ],
        onDestinationSelected: (int value) {
          setState(() {
            clientSelection = value;
          });
        },
        selectedIndex: clientSelection,
      ),
    );
  }
}
