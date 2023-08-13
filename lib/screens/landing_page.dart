import 'package:flutter/material.dart';
import 'package:movie_bracket/screens/host_bracket.dart';
import 'package:movie_bracket/screens/join_bracket.dart';

class CreateOrJoinPage extends StatelessWidget {
  const CreateOrJoinPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HostBracketPage(
                    title: 'Lobby',
                  );
                }));
              },
              child: const Text('Create Bracket'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const EnterJoinCodePage(title: 'Enter Lobby Code');
                  },
                ));
              },
              child: const Text('Join Bracket'),
            ),
          )
        ],
      ),
    );
  }
}
