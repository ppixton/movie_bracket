import 'package:flutter/material.dart';
import 'package:movie_bracket/screens/landing_page.dart';

class EnterJoinCodePage extends StatefulWidget {
  const EnterJoinCodePage({super.key, required this.title});
  final String title;

  @override
  State<EnterJoinCodePage> createState() => _EnterJoinCodeState();
}

class _EnterJoinCodeState extends State<EnterJoinCodePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController joinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Center(
            child: TextFormField(
              controller: joinCodeController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Enter Join Code"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('Join Bracket'),
            ),
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
              child: const Text('Back'),
            ),
          )
        ]),
      ),
    );
  }
}
