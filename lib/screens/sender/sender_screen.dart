import 'package:erobot/config/config_constant.dart';
import 'package:erobot/constant/app_constant.dart';
import 'package:erobot/notifier/sender_screen_notifier.dart';
import 'package:erobot/screens/home/bluetooth_screen/bluetooth_screen.dart';
import 'package:erobot/widgets/er_tap_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SenderScreen extends HookWidget {
  const SenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(senderScreenNotifier);
    final controller = useTextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sender"),
          actions: [
            IconButton(
              icon: const Icon(Icons.bluetooth),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => BluetoothScreen()));
              },
            )
          ],
        ),
        body: ListView(
          padding: ConfigConstant.layoutPadding,
          children: [
            buildSenderField(
              controller: controller,
              notifier: notifier,
              context: context,
            ),
            const SizedBox(height: ConfigConstant.margin2),
            if (notifier.recent?.isNotEmpty == true) const Text("Recently"),
            const SizedBox(height: ConfigConstant.margin1),
            Wrap(
              children: List.generate(
                notifier.recent?.length ?? 0,
                (index) {
                  final item = notifier.recent?[index];
                  return buildRecentItem(
                    controller: controller,
                    item: item,
                    notifier: notifier,
                    context: context,
                    index: index,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSenderField({
    required TextEditingController controller,
    required SenderScreenNotifier notifier,
    required BuildContext context,
  }) {
    return TextField(
      controller: controller,
      onSubmitted: (value) async => await notifier.addToList(controller.text),
      decoration: InputDecoration(
        labelText: "String to send",
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
        suffixIcon: IconButton(
          onPressed: () async => await notifier.addToList(controller.text),
          icon: Icon(
            Icons.send,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget buildRecentItem({
    required TextEditingController controller,
    required String item,
    required SenderScreenNotifier notifier,
    required BuildContext context,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: ConfigConstant.margin1, bottom: ConfigConstant.margin1),
      child: ERTapEffect(
        onTap: () async {
          controller.text = "$item";
          await notifier.removeFromList(item);
        },
        child: Chip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          label: Text("$item", style: Theme.of(context).textTheme.caption),
          backgroundColor:
              AppConstant.recentBackgroundColor[index % AppConstant.recentBackgroundColor.length],
          onDeleted: () => notifier.removeFromList(item),
          deleteIcon: Icon(
            Icons.cancel,
            size: ConfigConstant.iconSize1,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
