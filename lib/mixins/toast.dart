import 'package:erobot_mobile/widgets/er_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as t;
import 'package:get/get.dart';

mixin Toast {
  /// This will automatically hide login when loginWithEmail<future> is completed.
  ///
  /// ```
  /// await showLoading(
  ///   () => authApi.loginWithEmail(
  ///     email: controller.email.value,
  ///     password: controller.password.value,
  ///   ),
  /// );
  /// ```
  Future<T> showLoading<T>(Future<T> Function() callback) {
    return Get.showOverlay(
      asyncFunction: callback,
      loadingWidget: Center(child: ERLoading()),
    );
  }

  // TODO: implement show error with getx
  void showError({
    required BuildContext context,
    required String? title,
    String? closeLabel,
    String? subtitle,
    Function? onClose,
    bool barrierDismissible = true,
    bool showCancelButton = false,
  }) {}

  // TODO: implement show success with getx
  void showSuccess({
    required BuildContext context,
    required String title,
    String? subtitle,
    Function? onClose,
  }) {}

  Future<void> showSnackbar({
    required String title,
    required String message,
    bool showProgressIndicator = false,
  }) async {
    if (Get.isSnackbarOpen == true) Get.back();
    SnackbarController controller = Get.showSnackbar(
      GetSnackBar(
        title: title.trim().isNotEmpty ? title : 'Title',
        message: message.trim().isNotEmpty ? message : 'Message',
        showProgressIndicator: showProgressIndicator,
      ),
    );
    return controller.future;
  }

  void closeSnackbar() {
    if (Get.isSnackbarOpen == true) Get.back();
  }

  void showToast(String message) {
    t.Fluttertoast.showToast(
      msg: message,
      toastLength: message.length < 50 ? t.Toast.LENGTH_SHORT : t.Toast.LENGTH_LONG,
      gravity: t.ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }
}
