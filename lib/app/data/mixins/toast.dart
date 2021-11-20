import 'package:bot_toast/bot_toast.dart';
import 'package:erobot_mobile/app/data/widgets/er_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Toast {
  showLoading() {
    BotToast.showCustomLoading(toastBuilder: (callback) {
      return ERLoading();
    });
  }

  hideLoading() {
    BotToast.closeAllLoading();
  }

  showToast(String text) {
    BotToast.showText(text: text);
  }

  void showError({
    required BuildContext context,
    required String? title,
    String? closeLabel,
    String? subtitle,
    Function? onClose,
    bool barrierDismissible = true,
    bool showCancelButton = false,
  }) {
    BotToast.showNotification(
      leading: (_) => AspectRatio(
        aspectRatio: 1 / 1.5,
        child: Container(
          alignment: Alignment.centerRight,
          child: Icon(Icons.error),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
      title: (_) => Text(
        title ?? "",
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).colorScheme.onError),
      ),
      backgroundColor: Theme.of(context).colorScheme.error,
      subtitle: (_) => Text(
        subtitle ?? "",
        style: Theme.of(context)
            .textTheme
            .caption
            ?.copyWith(color: Theme.of(context).colorScheme.onError.withOpacity(0.75)),
      ),
      onClose: () => {
        onClose != null ? onClose() : () {},
      },
    );
  }

  void showSuccess({
    required BuildContext context,
    required String title,
    String? subtitle,
    Function? onClose,
  }) {
    BotToast.showNotification(
      leading: (_) => AspectRatio(
        aspectRatio: 1 / 1.5,
        child: Container(
          alignment: Alignment.centerRight,
          child: Icon(Icons.verified),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
      title: (_) => Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      backgroundColor: Colors.green,
      subtitle: (_) => Text(
        subtitle ?? "",
        style: Theme.of(context)
            .textTheme
            .caption
            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.75)),
      ),
      onClose: () => {
        onClose != null ? onClose() : () {},
      },
    );
  }
}
