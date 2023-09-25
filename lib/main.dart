import 'package:code_playground/files_tab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 255, 102, 0),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).colorScheme.surfaceVariant;

    return Material(
      elevation: 12,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      shadowColor: Colors.transparent,
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.transparent,
            leading: Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              clipBehavior: Clip.hardEdge,
              shadowColor: Colors.transparent,
              surfaceTintColor: Theme.of(context).colorScheme.primary,
              color: Colors.transparent,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              )
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Planner",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Text("saved minute ago",
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 16),
            child: Material(
              elevation: 1,
              clipBehavior: Clip.hardEdge,
              surfaceTintColor: Theme.of(context).colorScheme.primary,
              shadowColor: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(32)),
              color: Theme.of(context).colorScheme.surface,
              child: SizedBox.expand(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilesTab(
                      files: ["main.dart", "list.dart"],
                    ),
                    Text(
                      "hello world",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.add),
          // ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
