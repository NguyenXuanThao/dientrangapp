import 'package:example_project/pages/login_screen.dart';
import 'package:example_project/src/constant/dt_icon.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      ///background
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(DTIcons.bgLogin), fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///back button
            Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black12, width: 1),
                        color: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ))),

            const SizedBox(
              height: 20,
            ),

            ///Title
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Đăng Ký',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ///content
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'Chỉ mất một phút để tạo tài khoản của bạn',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            ///edts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Số điện thoại',
                        hintText: 'Nhập số điện thoại',
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                          color: Colors.green,
                        ),
                        border: OutlineInputBorder()),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty
                          ? 'please enter phone number'
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                        labelText: 'Mật khẩu',
                        hintText: 'Nhập mật khẩu',
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.green,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        border: const OutlineInputBorder()),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'please enter password' : null;
                    },
                    obscureText: obscureText,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                        labelText: 'Xác nhận mật khẩu',
                        hintText: 'Nhập lại mật khẩu',
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.green,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        border: const OutlineInputBorder()),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'please enter password' : null;
                    },
                    obscureText: obscureText,
                  )
                ],
              )),
            ),

            const SizedBox(
              height: 40,
            ),

            ///button login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.green),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {},
                  textColor: Colors.white,
                  child: const Text('Đăng Ký'),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Bạn có tai khoản ?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.green),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
