import 'package:erobot_mobile/app/data/widgets/er_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
}
