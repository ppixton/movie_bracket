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
      title: 'Movie Bracket App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreateOrJoinPage(title: 'Welcome'),
    );
  }
}

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

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: userController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Username"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (userController.text == "parker") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      user: userController.text,
                                    )),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid Credentials')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});
  final String user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Column(
          children: [
            Text(user),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go back!"),
              ),
            ),
          ],
        ));
  }
}
