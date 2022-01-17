import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:member_app/features/auth/logic/auth_provider.dart';
import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/contextless_nav.dart';
import 'package:member_app/utils/loader_v2.dart';
import 'package:member_app/utils/routes.dart';
import 'package:member_app/utils/string_constants.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: FormBuilder(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: deviceSize.height * 0.9,
                  width: deviceSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: deviceSize.width * 0.4,
                        child: Hero(
                          tag: 'eltanvir',
                          child: Image.asset('assets/images/loader.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: KEltDecoration.boxDecoration1,
                        width: deviceSize.width * 0.9,
                        child: FormBuilderTextField(
                          style: const TextStyle(color: KEltColor.primary),
                          keyboardType: TextInputType.number,
                          name: 'card_number',
                          decoration:
                              KEltInputDecoration.inputDecoration.copyWith(
                            labelText: 'Input Your Card Number',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: KEltDecoration.boxDecoration1,
                        width: deviceSize.width * 0.9,
                        child: FormBuilderTextField(
                          keyboardType: TextInputType.text,
                          name: 'password',
                          style: const TextStyle(color: KEltColor.primary),
                          obscureText: true,
                          obscuringCharacter: '#',
                          decoration:
                              KEltInputDecoration.inputDecoration.copyWith(
                            labelText: 'Input Your Password',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.minLength(context, 6),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer(
                        builder: (
                          BuildContext context,
                          WidgetRef ref,
                          Widget? child,
                        ) {
                          final _login = ref.watch(authProvider);
                          return _login.map(
                            initial: (_) => LoginButton(
                              formkey: _formkey,
                              deviceSize: deviceSize,
                            ),
                            loading: (_) => const LoaderV2(),
                            loaded: (_) {
                              Hive.openBox(StringConstants.authBox)
                                  .then((value) async {
                                await value.put(
                                  StringConstants.token,
                                  _.data.token,
                                );
                                ContextLess.nav.pushReplacementNamed(
                                  Routes.home,
                                );
                              });

                              return const SizedBox();
                            },
                            error: (_) {
                              return LoginButton(
                                formkey: _formkey,
                                deviceSize: deviceSize,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends ConsumerWidget {
  const LoginButton({
    Key? key,
    required GlobalKey<FormBuilderState> formkey,
    required this.deviceSize,
  })  : _formkey = formkey,
        super(key: key);

  final GlobalKey<FormBuilderState> _formkey;

  final Size deviceSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        if (_formkey.currentState!.saveAndValidate()) {
          final Map<String, FormBuilderFieldState<FormBuilderField, dynamic>>
              _formdata = _formkey.currentState!.fields;
          ref.watch(authProvider.notifier).login(
                card_number: _formdata['card_number']!.value as String,
                password: _formdata['password']!.value as String,
              );
          // await _authController.loginUser(
          //   email:
          //       _formdata['email']!.value as String,
          //   password: _formdata['password']!.value
          //       as String,
          // );
        }
      },
      child: Container(
        decoration: KEltDecoration.boxDecoration1,
        height: 50,
        width: deviceSize.width * 0.9,
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: KEltColor.primary,
            ),
          ),
        ),
      ),
    );
  }
}
