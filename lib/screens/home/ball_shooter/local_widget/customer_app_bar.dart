import 'package:flutter/material.dart';

class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  final Color? color;
  final AppBar? appBar;

  const CustomerAppBar(
      {Key? key, required this.title, this.action, this.appBar, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    return AppBar(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: action,
      title: Text(title),
      flexibleSpace: Container(
        color: Theme.of(context).colorScheme.background,
        width: double.infinity,
        height: appBarHeight * 2,
        child: CustomPaint(
          painter: AppBarPainter(context),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      new Size.fromHeight(appBar?.preferredSize.height ?? kToolbarHeight);
}

class AppBarPainter extends CustomPainter {
  final BuildContext context;

  AppBarPainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // CONTAINER RIGHT
    paint.color = Theme.of(context).colorScheme.surface.withOpacity(0.4);
    var path3 = Path();

    path3.lineTo(size.width / 2 - 70, 0);
    path3.lineTo(size.width / 2, size.height);
    path3.lineTo(size.width, size.height);
    path3.lineTo(size.width, 0);

    canvas.drawPath(path3, paint);
    path3.close();

    // CONTAINER MIDDLE
    paint.color = Theme.of(context).colorScheme.primary;
    var path2 = Path();

    path2.lineTo(0, size.height / 1.5);
    path2.lineTo(size.width / 1.5, size.height / 1.5);
    path2.lineTo(size.width / 1.5 - 45, 0);

    canvas.drawPath(path2, paint);
    path2.close();

    // CONTAINER LEFT
    paint.color = Theme.of(context).colorScheme.surface;
    var path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width / 2.8 - 50, size.height);
    path.lineTo(size.width / 2.8, 0);
    canvas.drawPath(path, paint);

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
