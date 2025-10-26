import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. Set the Title for the Web Browser Tab
      title: 'Jane Doe - Software Developer',
      // 2. Define the app-wide style (Theme)
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        // Optional: Define a clean, professional font
        fontFamily: 'RobotoMono',
      ),
      // 3. Set the home screen to our new structure
      home: const ResumeScreen(),
    );
  }
}

// Placeholder Widgets for the content (we'll fill these later)
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900, // Dark background for contrast
      padding: const EdgeInsets.all(24.0),
      child: const Center(
        child: Text(
          'Contact & Skills (Sidebar)',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience & Education (Main)',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2000), // Filler to test scrolling
        ],
      ),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  // Define the breakpoint for when the layout switches from vertical to horizontal
  static const double desktopBreakpoint = 800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Name - Online Résumé'),
        elevation: 0, // Remove shadow for a flatter design
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Check if the current width is larger than our desktop breakpoint
          if (constraints.maxWidth > desktopBreakpoint) {
            // --- DESKTOP LAYOUT (Sidebar and Main Content side-by-side) ---
            return const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar: Takes 30% of the screen width
                SizedBox(width: 300, child: Sidebar()),
                // Main Content: Takes the remaining space and can scroll
                Expanded(child: MainContent()),
              ],
            );
          } else {
            // --- MOBILE/NARROW LAYOUT (All content stacked vertically) ---
            return const Column(
              children: [
                Sidebar(),
                // Use Expanded to allow the MainContent to take up the rest of the space and scroll
                Expanded(child: MainContent()),
              ],
            );
          }
        },
      ),
    );
  }
}
