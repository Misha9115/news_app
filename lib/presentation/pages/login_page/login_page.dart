import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/pages/login_page/login_page_vm.dart';
import 'package:news_paper/presentation/widgets/global_button.dart';
import 'package:news_paper/presentation/widgets/login_button.dart';
import 'package:news_paper/presentation/widgets/custom_text_field.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/store/application/app_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginPageVM>(
      converter: LoginPageVM.init,
      distinct: false,
      builder: (context, vm) {
        return Scaffold(
          body: _Widget(
            vm: vm,
          ),
        );
      },
    );
  }
}

class _Widget extends StatefulWidget {
  final LoginPageVM vm;

  const _Widget({required this.vm, Key? key}) : super(key: key);

  @override
  State<_Widget> createState() => _WidgetState();
}

class _WidgetState extends State<_Widget> {
  bool _isSingIn = true;

  final TextEditingController _loginController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0, top: 25.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: AppColors.grey.withOpacity(0.2),
                  ),
                ),
                height: 50.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          setState(() => _isSingIn = true);
                        },
                        child: Container(
                          height: 47.0,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: _isSingIn ? AppColors.white : AppColors.grey.withOpacity(0.00),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.singIn,
                              style: _isSingIn ? AppFonts.signButtonA : AppFonts.signButtonP,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        key: const Key(keysUpButton),
                        onTap: () {
                          setState(() => _isSingIn = false);
                        },
                        child: Container(
                          height: 46.0,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: _isSingIn ? AppColors.grey.withOpacity(0.00) : AppColors.white,
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.singUp,
                              style: _isSingIn ? AppFonts.signButtonP : AppFonts.signButtonA,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0, bottom: 50.0),
                child: Text(
                  _isSingIn ? AppLocalizations.of(context)!.singIn : AppLocalizations.of(context)!.singUp,
                  style: AppFonts.emptyFav,
                ),
              ),
            ),
            CustomTextField(
              controller: _loginController,
              keyValue: keyLogin,
              hintText: AppLocalizations.of(context)!.login,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: _passwordController,
              keyValue: keyPassword,
              hintText: AppLocalizations.of(context)!.password,
            ),
            if(_isSingIn==false)
                 Column(
                    children: [
                      const SizedBox(height: 15.0),
                      CustomTextField(
                        controller: _confirmPasswordController,
                        keyValue: keyConfirmPassword,
                        hintText: AppLocalizations.of(context)!.cPassword,
                      ),
                      const SizedBox(height: 15.0),
                    ],
                  ),
            LoginButton(
              function: () => widget.vm.registrationWithGoogle(),
              hintTextStyle: AppFonts.buttonLogReg,
              image: googleLogo,
              padding: 20.0,
              onTap: _isSingIn,
              textR: AppLocalizations.of(context)!.singUp,
              textS: AppLocalizations.of(context)!.singIn,
            ),
            GlobalButton(
              fontSize: widget.vm.fontSize,
              key: GlobalKey(debugLabel: keyButton),
              text: _isSingIn ? AppLocalizations.of(context)!.singIn : AppLocalizations.of(context)!.singUp,
              onTap: () {
                _isSingIn
                    ? widget.vm.login(_loginController.text, _passwordController.text)
                    : widget.vm.registration(_loginController.text, _passwordController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
