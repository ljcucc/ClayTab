import 'package:code_playground/code_editor.dart';
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
      elevation: 0,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      shadowColor: Colors.transparent,
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: Material(
              elevation: 12,
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
                FilesTab(
                  files: [
                    "Interactive",
                    "Text",
                  ],
                ),
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
              child: CodeEditor(
                code:
                    "Start Padding\n\t\t\t\tStart EdgeInset.only top 18 End\nEnd Padding",
                // "",
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
