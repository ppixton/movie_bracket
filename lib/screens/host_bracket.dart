import 'package:flutter/material.dart';
import 'package:movie_bracket/screens/landing_page.dart';

class HostBracketPage extends StatelessWidget {
  const HostBracketPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('JKLB'),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CreateOrJoinPage(title: 'Welcome');
                    },
                  ));
                },
                child: const Text('Go Back')),
          )
        ],
      ),
    );
  }
}
