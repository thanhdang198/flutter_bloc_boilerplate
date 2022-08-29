import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gopage_pos/utils/route.dart';

import '../../bloc/login_bloc/login_bloc_bloc.dart';

import '../../bloc/login_bloc/login_bloc_state.dart';
import '../../components/brand_button.dart';
import '../../components/input_field.dart';
import '../../components/password_input_field.dart';
import '../../plugins/scaffold_message.dart';
import '../../style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size? size;
  TextEditingController? _userNameController,
      _passwordController,
      _displayNameController;
  FocusNode? _userNameNode, _displayNameNode, _passwordNode;
  late LoginBlocBloc _loginBloc;
  bool _isLoading = false;
  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBlocBloc>(context);
    _userNameNode = FocusNode();
    _displayNameNode = FocusNode();
    _passwordNode = FocusNode();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _displayNameController = TextEditingController();
    _passwordController?.text = 'GoCall123';
    _userNameController?.text = 'extension1';
    _displayNameController?.text = 'GoStream';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocListener<LoginBlocBloc, LoginBlocState>(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state.hasError) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()));
          showMessage(context, state.errorMessage, color: red);
        }
      },
      child: BlocBuilder<LoginBlocBloc, LoginBlocState>(
        bloc: _loginBloc,
        builder: (_, state) => GestureDetector(
          onTap: () => setState(() {
            FocusScope.of(context).requestFocus(FocusNode());
          }),
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: size!.height * 0.035),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Đăng nhập ',
                                style: h0,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Vui lòng đăng nhập để sử dụng Gopage - Máy bán hàng!',
                                style: splashDescription
                                  ..copyWith(fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: size!.height * 0.08,
                              ),
                              InputField(
                                focusNode: _userNameNode,
                                controller: _userNameController,
                                hintText: 'Tên đăng nhập',
                                fieldName: 'Tên đăng nhập',
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PasswordField(
                                  focusNode: _passwordNode,
                                  controller: _passwordController,
                                  hintText: 'Mật khẩu',
                                  fieldName: 'Mật khẩu'),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      MediaQuery.of(context).viewInsets.bottom > 100
                          ? const SizedBox.shrink()
                          : BrandButton(
                              onPressed: _isLoading
                                  ? () {}
                                  : () async {
                                      if (_userNameController?.text.isEmpty ==
                                          true) {
                                        _userNameNode?.requestFocus();
                                        showMessage(context,
                                            'Tài khoản không được để trống');
                                        return;
                                      }
                                      if (_passwordController?.text.isEmpty ==
                                          true) {
                                        _passwordNode?.requestFocus();
                                        showMessage(context,
                                            'Mật khẩu không được để trống');
                                        return;
                                      }
                                      if (_displayNameController
                                              ?.text.isEmpty ==
                                          true) {
                                        _displayNameNode?.requestFocus();
                                        showMessage(context,
                                            'Tên hiển thị không được để trống');
                                        return;
                                      }
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      EasyLoading.show();
                                      await Future.delayed(
                                          const Duration(seconds: 2));
                                      EasyLoading.dismiss();

                                      Navigator.pushNamedAndRemoveUntil(
                                          context, Routers.dashboard,
                                          (Route<dynamic> route) {
                                        return false;
                                      });
                                    },
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 55,
                                      child: SpinKitThreeBounce(
                                        size: 20,
                                        color: white,
                                      ),
                                    )
                                  : SizedBox(
                                      height: 55,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text('Đăng nhập'),
                                        ],
                                      ),
                                    ),
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
