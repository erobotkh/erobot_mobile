import 'package:bot_toast/bot_toast.dart';
import 'package:erobot/screens/app_bar_main_screen.dart';
import 'package:erobot/services/authentication/auth_api.dart';
import 'package:erobot/storage/uesr_token_storage.dart';
import 'package:flutter/material.dart';
import 'constant/theme_constant.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MaterialApp(
      home: AppBarMainScreen(),
      // home: Test(),
      theme: ThemeConstant.theme,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: botToastBuilder(
            context,
            child ?? const SizedBox(),
          ),
        );
      },
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.amber,
              child: TextButton(
                onPressed: () async {
                  await getApi();
                },
                child: Text('GET'),
              ),
            ),
            SizedBox(height: 16),
            Container(
              color: Colors.amber,
              child: TextButton(
                onPressed: () async {
                  var storage = UserTokenStorage();
                  var token = await storage.read();
                  print('token: $token');
                },
                child: Text('GET Access Token'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getApi() async {
    AuthApi authApi = AuthApi();
    var respone = await authApi.exec(email: 'soksan2@gmail.com', password: '123456');
    if (authApi.success())
      print('Success');
    else
      print('Error : ${authApi.errorMessage()}');
    return respone;
  }
}
