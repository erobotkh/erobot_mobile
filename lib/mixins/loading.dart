import 'package:bot_toast/bot_toast.dart';
import 'package:erobot_mobile/widgets/widgets.dart';

mixin Loading {
  showLoading() {
    BotToast.showCustomLoading(toastBuilder: (callback) {
      return ERLoading();
    });
  }

  clearAll() {
    BotToast.cleanAll();
  }

  hideLoading() {
    BotToast.closeAllLoading();
  }
}
