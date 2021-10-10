import 'package:erobot/config/config_constant.dart';
import 'package:erobot/models/remoter_button_model.dart';
import 'package:erobot/widgets/er_back_button.dart';
import 'package:erobot/widgets/er_tap_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IRRemoterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<RemotterButtonModel> remoteButtonList = RemotterButtonModel.getButtonList(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton(
          elevation: 1,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.onSurface,
            size: ConfigConstant.iconSize2,
          ),
          onPressed: () => print('Setting'),
        ),
        appBar: AppBar(
          leading: ERBackButton(),
          title: Text(
            'IR Remoter',
          ),
          actions: [
            Container(
              height: ConfigConstant.objectHeight2,
              width: ConfigConstant.objectHeight2,
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.bluetooth),
                onPressed: () => print('Bluetooth'),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 72.0,
            vertical: 16,
          ),
          child: Column(
            children: [
              Image.asset('assets/images/channel.png'),
              StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                itemCount: remoteButtonList.length,
                mainAxisSpacing: 12,
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                itemBuilder: (BuildContext context, int index) {
                  RemotterButtonModel remoteButton = remoteButtonList[index];
                  return Column(
                    children: [
                      if (remoteButton.label != null)
                        Text(
                          remoteButton.label ?? '',
                          style: Theme.of(context).textTheme.overline,
                        ),
                      ERTapEffect(
                        onTap: remoteButton.onTap,
                        child: Container(
                          width: ConfigConstant.objectHeight2,
                          height: ConfigConstant.objectHeight2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: remoteButton.color,
                          ),
                          child: remoteButton.child,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ));
  }
}
