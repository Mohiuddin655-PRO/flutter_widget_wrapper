import 'package:flutter/material.dart';
import 'package:flutter_widget_wrapper/flutter_widget_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Wrapper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WrapperExample(),
    );
  }
}

class WrapperExample extends StatelessWidget {
  const WrapperExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              WidgetWrapper(
                wrap: (con, size) {
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          size.width * 0.1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text("$size"),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24, width: 24),
              WidgetWrapper(
                wrap: (con, size) {
                  return Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          size.width * 0.1,
                        ),
                      ),
                      child: Text("$size"),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24, width: 24),
              WidgetWrapper(
                wrap: (con, size) {
                  return Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          size.width * 0.1,
                        ),
                      ),
                      child: Text("$size"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
