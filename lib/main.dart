import 'package:flutter/material.dart';

void main() {
  runApp(const DWCApp());
}

class DWCApp extends StatelessWidget {
  const DWCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DWC Buddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ec = 0.8;
  double ph = 6.0;

  DateTime lastWaterChange = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final days = DateTime.now().difference(lastWaterChange).inDays;

    return Scaffold(
      appBar: AppBar(
        title: const Text("DWC Buddy 🌱"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("EC waarde"),
            Slider(
              value: ec,
              min: 0,
              max: 3,
              onChanged: (v) => setState(() => ec = v),
            ),
            Text("EC: ${ec.toStringAsFixed(2)}"),

            const SizedBox(height: 20),

            const Text("pH waarde"),
            Slider(
              value: ph,
              min: 4,
              max: 9,
              onChanged: (v) => setState(() => ph = v),
            ),
            Text("pH: ${ph.toStringAsFixed(2)}"),

            const SizedBox(height: 30),

            Text(
              "Laatste waterwissel: $days dagen geleden",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  lastWaterChange = DateTime.now();
                });
              },
              child: const Text("Water gewisseld"),
            ),
          ],
        ),
      ),
    );
  }
}
