import 'package:erobot_mobile/app/modules/emergency/controllers/emc_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

class EmcHomeView extends GetView<EmcHomeController> {
  RadioGroupController myController = RadioGroupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome back!"),
          actions: [
            buildThemeSwitcherButton(context),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            builEmergencyContactSetion(context),
            SizedBox(
              height: 15,
            ),
            builEmergencyCompanySetion(context)
          ],
        ));
  }

  Widget buildThemeSwitcherButton(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.dark_mode),
        onPressed: () {},
      ),
    );
  }

  Widget builEmergencyContactSetion(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Emergency Contact',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                  backgroundColor: Colors.grey,
                  textStyle: const TextStyle(fontSize: 13)),
              child: const Text('Phnom Penh'),
              onPressed: () {},
            ),
            Text(
              'See more',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        EmergencyContactTile(
          emergencyImage: 'assets/images/ambulance.png',
          title: "Ambulance",
          subTitle: '119',
          iconCall: 'assets/images/call.png',
          onTap: () {},
        ),
        SizedBox(height: 15.0),
        EmergencyContactTile(
          emergencyImage: 'assets/images/covid.png',
          title: "Covid 19",
          subTitle: '115\n012 825 424\n012 488 868',
          iconCall: 'assets/images/call.png',
          onTap: () {},
        ),
        SizedBox(height: 15.0),
        EmergencyContactTile(
          emergencyImage: 'assets/images/fire_truck.png',
          title: "Fire Truck",
          subTitle: '666',
          iconCall: 'assets/images/call.png',
          onTap: () {},
        ),
      ],
    );
  }

  Widget builEmergencyCompanySetion(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Emergency Company',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        EmergencyCompanyTile(
          companyLogo: 'assets/images/smart.png',
          title: "Smart Axista",
          subTitle: 'View command & prefix',
          onTap: () {},
        ),
        SizedBox(height: 15.0),
        EmergencyCompanyTile(
          companyLogo: 'assets/images/cellcard.png',
          title: "Cellcard",
          subTitle: 'View command & prefix',
          onTap: () {},
        ),
        SizedBox(height: 15.0),
        EmergencyCompanyTile(
          companyLogo: 'assets/images/metfone.png',
          title: "Metfone",
          subTitle: 'View command & prefix',
          onTap: () {},
        ),
        SizedBox(height: 15.0),
        EmergencyCompanyTile(
          companyLogo: 'assets/images/cooltel.png',
          title: "Cooltel",
          subTitle: 'View command & prefix',
          onTap: () {},
        ),
      ],
    );
  }
}

class EmergencyContactTile extends StatelessWidget {
  const EmergencyContactTile({
    required this.emergencyImage,
    required this.title,
    required this.subTitle,
    required this.iconCall,
    required this.onTap,
  });

  final String emergencyImage;
  final String title;
  final String subTitle;
  final String iconCall;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).focusColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      leading: CircleAvatar(
          radius: 20,
          backgroundColor: Color.fromARGB(255, 255, 223, 223),
          child: Image.asset(
            emergencyImage,
            width: 25,
            height: 25,
            fit: BoxFit.cover,
          )),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: ClipOval(
          child: Image.asset(
        iconCall,
        width: 25,
        height: 25,
        fit: BoxFit.cover,
      )),
      onTap: onTap,
    );
  }
}

class EmergencyCompanyTile extends StatelessWidget {
  const EmergencyCompanyTile({
    required this.companyLogo,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String companyLogo;
  final String title;
  final String subTitle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).focusColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      leading: Card(
          child: Image.asset(
        companyLogo,
        width: 50,
        height: 80,
        fit: BoxFit.fill,
      )),
      title: Text(title),
      subtitle: Text(subTitle),
      onTap: onTap,
    );
  }
}
