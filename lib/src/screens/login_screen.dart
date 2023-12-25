import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app_client/src/constants/router_path.dart';
import 'package:music_app_client/src/widgets/button_form.dart';
import 'package:music_app_client/src/widgets/input_form.dart';
import 'package:music_app_client/src/widgets/loading_widget.dart';
import 'package:music_app_client/src/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        hintText: 'Tên đăng nhập',
                        prefixIcon: Icon(
                          Icons.lock_person_outlined,
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
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: InkWell(
                  child: const Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              ButtonFormWidget(
                bgColor: Colors.blue[600],
                text: const Text(
                  'Đăng nhập',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      return const LoadingWidget();
                    },
                  );
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        routers[Paths.home]!,
                        (route) => false,
                      );
                    },
                  );
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
                      'Bạn chưa có tài khoản? Bấm vào ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'Đăng ký',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red[600],
                          fontWeight: FontWeight.bold,
                          decorationColor: Colors.red[600],
                          decorationThickness: 2,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, routers[Paths.register]!);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: 200,
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: const Center(
                  child: Text(
                    'hoặc',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SocialButtonWidget(
                icon: Icon(
                  FontAwesomeIcons.google,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
