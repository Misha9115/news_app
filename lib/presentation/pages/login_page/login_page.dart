import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_paper/presentation/layouts/main_layouts.dart';
import 'package:news_paper/presentation/pages/login_page/login_page_vm.dart';
import 'package:news_paper/presentation/pages/login_page/widgets/login_button.dart';
import 'package:news_paper/presentation/widgets/custom_text_field.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ScrollController _singleChildScroll = ScrollController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _checkIsSingIn = true;

  double offset = 0.0;

  @override
  void dispose() {
    _singleChildScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginPageVM>(
      converter: LoginPageVM.init,
      builder: (context, vm) {
        return MainLayout(
          bottomNavigationBar: false,
          appBar: false,
          body: loadingBooks(vm),
          selectedIndex: 1,
          title: '',
        );
      },
    );
  }

  Widget loadingBooks(LoginPageVM vm) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (scroll) {
        return false;
      },
      child: SingleChildScrollView(
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
                            setState(
                              () {
                                _checkIsSingIn = true;
                              },
                            );
                          },
                          child: Container(
                            height: 47.0,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: _checkIsSingIn ? AppColors.white : AppColors.grey.withOpacity(0.00),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.singIn,
                                style: _checkIsSingIn ? AppFonts.signButtonA : AppFonts.signButtonP,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _checkIsSingIn = false;
                            });
                          },
                          child: Container(
                            height: 46.0,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: _checkIsSingIn ? AppColors.grey.withOpacity(0.00) : AppColors.white,
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.singUp,
                                style: _checkIsSingIn ? AppFonts.signButtonP : AppFonts.signButtonA,
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
                  padding: const EdgeInsets.symmetric(vertical: 28.0),
                  child: Text(
                    _checkIsSingIn ? AppLocalizations.of(context)!.singIn : AppLocalizations.of(context)!.singUp,
                    style: AppFonts.emptyFav,
                  ),
                ),
              ),
              AppTextField(
                controller: _loginController,
                keyValue: keyLogin,
                hintText: AppLocalizations.of(context)!.login,
              ),
              const SizedBox(height: 15.0),
              AppTextField(
                controller: _passwordController,
                keyValue: keyPassword,
                hintText: AppLocalizations.of(context)!.password,
              ),
              _checkIsSingIn
                  ? const SizedBox(
                      height: 15.0,
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 15.0),
                        AppTextField(
                          controller: _confirmPasswordController,
                          keyValue: keyConfirmPassword,
                          hintText: AppLocalizations.of(context)!.cPassword,
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    ),
              GlobalButton(
                text: _checkIsSingIn ? AppLocalizations.of(context)!.singIn : AppLocalizations.of(context)!.singUp,
                onTap: () {
                  _checkIsSingIn
                      ? vm.login(_loginController.text, _passwordController.text)
                      : vm.registration(_loginController.text, _passwordController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
