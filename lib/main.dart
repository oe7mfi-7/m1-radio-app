import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RadioM1App());
}

class RadioM1App extends StatelessWidget {
  const RadioM1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const PlayerScreen(),
    );
  }
}

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PlayerScreenStateful();
  }
}

class _PlayerScreenStateful extends StatefulWidget {
  const _PlayerScreenStateful();

  @override
  State<_PlayerScreenStateful> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<_PlayerScreenStateful> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF0B100E))
      ..clearCache() 
      ..loadRequest(Uri.parse('https://radio-m1.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B100E),
      body: SafeArea(
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
