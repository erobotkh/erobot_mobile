import 'package:erobot/screens/app_bar_main_screen.dart';
import 'package:erobot/services/user_api.dart';
import 'package:flutter/material.dart';
import 'constant/theme_constant.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBarMainScreen(),
      // home: Test(),
      theme: ThemeConstant.theme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: child ?? const SizedBox(),
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
      body: Center(
        child: TextButton(
          onPressed: () async {
            var result = await getApi();
            print(result);
          },
          child: Text('GET'),
        ),
      ),
    );
  }

  getApi() async {
    UserApi userApi = UserApi();
    var respone = await userApi.fetchAll();
    if (userApi.success() && respone != null)
      print('respone: $respone');
    else
      print('Error : ${userApi.errorMessage()}');
    return respone;
  }
}
