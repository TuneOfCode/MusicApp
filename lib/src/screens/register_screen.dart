import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app_client/src/constants/router_path.dart';
import 'package:music_app_client/src/widgets/button_form.dart';
import 'package:music_app_client/src/widgets/input_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late bool _isShowPassword;

  @override
  void initState() {
    super.initState();
    _isShowPassword = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/bg_login.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black12.withOpacity(0.7),
                BlendMode.hardLight,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/login_music_icon.webp'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: ListBody(
                    children: [
                      const InputFormWidget(
                        hintText: 'Họ và tên',
                        prefixIcon: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white54,
                        ),
                      ),
                      const InputFormWidget(
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white54,
                        ),
                      ),
                      InputFormWidget(
                        hintText: 'Mật khẩu',
                        isPassword: !_isShowPassword,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.white54,
                        ),
                        suffixIcon: InkWell(
                          child: Icon(
                            _isShowPassword
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.white60,
                          ),
                          onTap: () {
                            setState(() {
                              _isShowPassword = !_isShowPassword;
                            });
                          },
                        ),
                      ),
                      InputFormWidget(
                        hintText: 'Nhập lại mật khẩu',
                        isPassword: !_isShowPassword,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.white54,
                        ),
                        suffixIcon: InkWell(
                          child: Icon(
                            _isShowPassword
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.white60,
                          ),
                          onTap: () {
                            setState(() {
                              _isShowPassword = !_isShowPassword;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonFormWidget(
                bgColor: Colors.white,
                text: Text(
                  'Đăng ký',
                  style: TextStyle(
                    color: Colors.red[600],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, routers[Paths.login]!);
                },
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Bạn đã có tài khoản? Bấm vào ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red[600],
                          fontWeight: FontWeight.bold,
                          decorationColor: Colors.red[600],
                          decorationThickness: 2,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, routers[Paths.login]!);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
