import 'package:auto_route/auto_route.dart';
import 'package:bms_app/core/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bms_app/widgets/toast.dart';
import 'package:bms_app/features/auth/data/model/req_params/login_params.dart';

import '../../../../core/data/models/result_state.dart';
import '../../../../core/data/remote/network_exceptions.dart';
import '../../../../core/resources/ui_assets.dart';
import '../../../../widgets/custom_system_overlays.dart';
import '../../../../widgets/dismiss_focus_overlay.dart';
import '../../../../widgets/flushbar.dart';
import '../../../../widgets/app_logo.dart';
import '../../../../widgets/forms/buttons.dart';
import '../../../../widgets/forms/textfields.dart';
import '../providers/login_notifier.dart';

class LoginPage extends ConsumerWidget {
  final LoginParams _loginParams = LoginParams();
  final _formKey = GlobalKey<FormBuilderState>();

  final Function(bool loggedIn)? onLoginCallback;
  final bool? authGuard;

  LoginPage({Key? key, this.authGuard = true, this.onLoginCallback})
      : super(key: key);

  void _loginSuccess(BuildContext context) {
    CustomToast.success('Logged in successfully');
    //fetch profile on login
    if (authGuard == false) {
      context.router.pop(true);
    } else {
      onLoginCallback!(true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);
    ref.listen<ResultState>(loginProvider, (previous, next) {
      next.maybeMap(
          error: (error) => AppFlushBar.error(
              context,
              NetworkExceptions.getErrorMessage(
                  error.error as NetworkExceptions)),
          data: (_) {
            _loginSuccess(context);
          },
          orElse: () {});
    });
    return Scaffold(
        body: SafeArea(
      child: DarkThemeAnnotatedRegion(
        child: DismissFocusOverlay(
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: AppLogo(
                        aspectRatio: 3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        context.emptySizedHeightBoxNormal,
                        Center(
                          child: Text(
                            'Login to DirectCare',
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        context.emptySizedHeightBoxNormal,
                        PrimaryTextField(
                          initialValue: 'Test@gmail.com',
                          prefixIcon: _buildTextFieldIcon('message.svg'),
                          fillColor: Colors.black12,
                          label: "Username",
                          textInputType: TextInputType.text,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: "Username is required"),
                            // FormBuilderValidators.match(context,r'(?:\+977[- ])?\d{2}-?\d{7,8}',errorText: "Enter a valid mobile number"),
                          ]),
                          onSaved: (newValue) {
                            _loginParams.username = newValue;
                          },
                        ),
                        context.emptySizedHeightBoxLow2x,
                        PrimaryTextField(
                          initialValue: 'Password@1',
                          prefixIcon: _buildTextFieldIcon('lock.svg'),
                          fillColor: Colors.black12,
                          textInputType: TextInputType.visiblePassword,
                          isPassword: true,
                          label: "Password",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: "Password is required"),
                          ]),
                          onSaved: (newValue) {
                            _loginParams.password = newValue;
                          },
                        ),
                        context.emptySizedHeightBoxLow,
                        InkWell(
                          onTap: () {},
                          child: Container(
                              alignment: Alignment.centerRight,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Forgot your password ?',
                                style: context.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: context.textColor),
                              )),
                        ),
                        context.emptySizedHeightBoxNormal,
                        PrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState!.saveAndValidate()) {
                              // ref.read(loginProvider.notifier).login(_loginParams);
                              _loginSuccess(context);
                            }
                            FocusScope.of(context).unfocus();
                          },
                          title: 'LOGIN',
                          widget: state is Loading
                              ? const CustomCupertinoIndicator()
                              : null,
                        ),
                        context.emptySizedHeightBoxHigh,
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  SvgPicture _buildTextFieldIcon(String path) => SvgPicture.asset(
        UIAssets.getSvg(path),
        width: 18,
      );
}

class _LoginBackButton extends StatelessWidget {
  const _LoginBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          margin: const EdgeInsets.only(top: 60, left: 15),
          child: IconButton(
            icon: const Icon(Icons.close),
            color: context.primaryColor,
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: () {
              Navigator.maybePop(context);
            },
          )),
    );
  }
}
