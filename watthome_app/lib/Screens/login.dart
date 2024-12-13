import 'package:flutter/material.dart';
import 'package:watthome_app/Screens/dwellerHome.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double width =
                  constraints.maxWidth > 600 ? 400 : constraints.maxWidth * 0.8;
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: width,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 200,
                          width: 200,
                          child: Image(
                              image: AssetImage('assets/Images/Logo.jpeg'))),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text('SIGN IN',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Text(
                          'Welcome back! Please login to your account.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // SizedBox(height: 20),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       labelText: 'Email',
                      //       border: OutlineInputBorder(),
                      //       filled: true,
                      //       fillColor: Colors.grey[200],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      //   child: TextField(
                      //     obscureText: true,
                      //     decoration: InputDecoration(
                      //       labelText: 'Password',
                      //       border: OutlineInputBorder(),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // navigate to home screen
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => DwellerHomeScreen()),
                      //     );
                      //   },
                      //   child: Text('Login'),
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     // navigate to forgot password screen
                      //   },
                      //   child: Text('Forgot Password?'),
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     // navigate to sign up screen
                      //   },
                      //   child: Text('Sign Up'),
                      // ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                filled: true,
                                fillColor: Color(0xFFD6D6D6),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 16.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              onSaved: (phone) {
                                // Save it
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  filled: true,
                                  fillColor: Color(0xFFD6D6D6),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 16.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                onSaved: (password) {
                                  // Save it
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  // Navigate to the main screen
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color(0xFF275054),
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: const StadiumBorder(),
                              ),
                              child: const Text("Login"),
                            ),
                            // single line divider and text "or"
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withOpacity(0.24),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Text(
                                    'or',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color!
                                              .withOpacity(0.64),
                                        ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withOpacity(0.24),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // social login buttons
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color!
                                            .withOpacity(0.24),
                                      ),
                                      minimumSize:
                                          const Size(double.infinity, 48),
                                      shape: const StadiumBorder(),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/Images/Logo.jpeg',
                                          height: 24,
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          'Google',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .color!
                                                    .withOpacity(0.64),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withOpacity(0.64),
                                    ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text.rich(
                                const TextSpan(
                                  text: "Don’t have an account? ",
                                  children: [
                                    TextSpan(
                                      text: "Sign Up",
                                      style:
                                          TextStyle(color: Color(0xFF00BF6D)),
                                    ),
                                  ],
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withOpacity(0.64),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
