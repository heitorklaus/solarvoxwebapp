// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:solarvox/app/modules/teste/teste_page.dart';
// import '../utils/theme_selector.dart';
// import '../utils/view_wrapper.dart';
// import '../widgets/bullet_list.dart';
// import '../widgets/navigation_arrow.dart';

// class AboutView extends StatefulWidget {
//   const AboutView({Key? key}) : super(key: key);

//   @override
//   _AboutViewState createState() => _AboutViewState();
// }

// class _AboutViewState extends State<AboutView>
//     with SingleTickerProviderStateMixin {
//   late double screenWidth;
//   late double screenHeight;
//   String loremIpsum =
//       'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.';

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   Modular.to.pushNamed(
//   //     '/teste',
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     return ViewWrapper(
//       desktopView: desktopView(),
//       mobileView: mobileView(),
//     );
//   }

//   Widget desktopView() {
//     return Stack(
//       children: [
//         Center(
//           child: CircularProgressIndicator(
//             color: Colors.cyan,
//           ),
//         ),
//         TestePage()
//       ],
//     );
//     // return Stack(
//     //   children: [
//     //     NavigationArrow(isBackArrow: false),
//     //     NavigationArrow(isBackArrow: true),
//     //     Row(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       crossAxisAlignment: CrossAxisAlignment.center,
//     //       children: [
//     //         Spacer(flex: 1),
//     //         Expanded(flex: 3, child: infoSection()),
//     //         Spacer(flex: 1),
//     //         Expanded(
//     //             flex: 3,
//     //             child: BulletList(
//     //               strings: [loremIpsum, loremIpsum, loremIpsum, loremIpsum],
//     //             )),
//     //         Spacer(flex: 1),
//     //       ],
//     //     )
//     //   ],
//     // );
//   }

//   Widget mobileView() {
//     // return Column(
//     //   children: [
//     //     SizedBox(height: screenHeight * 0.05),
//     //     infoText(),
//     //     SizedBox(height: screenHeight * 0.05),
//     //     Container(
//     //       height: screenHeight * 0.3,
//     //       child: BulletList(
//     //         strings: [loremIpsum, loremIpsum, loremIpsum, loremIpsum],
//     //       ),
//     //     ),
//     //   ],
//     // );

//     return Stack(
//       children: [
//         Center(
//           child: CircularProgressIndicator(
//             color: Colors.cyan,
//           ),
//         ),
//         TestePage()
//       ],
//     );
//   }

//   Widget infoSection() {
//     return Container(
//       width: screenWidth * 0.35,
//       child: Column(
//         children: [
//           profilePicture(),
//           SizedBox(height: screenHeight * 0.05),
//           infoText()
//         ],
//       ),
//     );
//   }

//   Widget profilePicture() {
//     return Container(
//       height: getImageSize(),
//       width: getImageSize(),
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(getImageSize() / 2),
//           child: Container(
//             color: Colors.grey,
//             child: Center(child: Text('PLACEHOLDER IMAGE')),
//           )),
//     );
//   }

//   double getImageSize() {
//     if (screenWidth > 1600 && screenHeight > 800) {
//       return 350;
//     } else if (screenWidth > 1300 && screenHeight > 600) {
//       return 300;
//     } else if (screenWidth > 1000 && screenHeight > 400) {
//       return 200;
//     } else {
//       return 150;
//     }
//   }

//   Widget infoText() {
//     return Text(
//       'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
//       overflow: TextOverflow.clip,
//       style: ThemeSelector.selectBodyText(context),
//     );
//   }
// }



// // ignore_for_file: file_names, sized_box_for_whitespace

// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:solarvox/app/shared/utils/view_wrapper.dart';
// import '../repositorie/projects_ engineering_store.dart';
// import 'package:flutter/material.dart';

// class ProjectsEngineeringPage extends StatefulWidget {
//   final String title;
//   const ProjectsEngineeringPage(
//       {Key? key, this.title = 'ProjectsEngineeringPage'})
//       : super(key: key);
//   @override
//   ProjectsEngineeringPageState createState() => ProjectsEngineeringPageState();
// }

// class ProjectsEngineeringPageState
//     extends ModularState<ProjectsEngineeringPage, ProjectsEngineeringStore> {
//   final controller2 = ProjectsEngineeringStore();

//   late double screenWidth;
//   late double screenHeight;

//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     return ViewWrapper(
//       desktopView: desktopView(),
//       mobileView: mobileView(),
//     );
//   }

//   Widget desktopView() {
//     return Column(
//       children: [
//         const Center(
//           child: CircularProgressIndicator(
//             color: Colors.cyan,
//           ),
//         ),
//         TextField(
//             decoration: const InputDecoration(
//                 border: OutlineInputBorder(), labelText: 'altura'),
//             onChanged: controller2.setAltura),
//         TextField(
//             decoration: const InputDecoration(
//                 border: OutlineInputBorder(), labelText: 'Peso'),
//             onChanged: controller2.setPeso),
//         const SizedBox(
//           height: 30,
//         ),
//         AnimatedBuilder(
//             animation: controller2.result,
//             builder: (context, child) {
//               return Text(controller2.result.value,
//                   style: const TextStyle(color: Colors.black));
//             }),
//         Observer(builder: (BuildContext context) {
//           return Text(
//             'ProjectsEngineering ' + controller2.value.toString(),
//             style: const TextStyle(color: Colors.black),
//           );
//         }),
//         ElevatedButton(
//             onPressed: () {
//               controller2.calculateImc();
//             },
//             child: const Text('CALCULAR'))
//       ],
//     );
//   }

//   Widget mobileView() {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Column(
//           children: [
//             TextField(onChanged: controller2.setAltura),
//           ],
//         ));
//   }

//   Widget profilePicture() {
//     return Container(
//       height: getImageSize(),
//       width: getImageSize(),
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(getImageSize() / 2),
//           child: Container(
//             color: Colors.grey,
//             child: const Center(child: Text('PLACEHOLDER IMAGE')),
//           )),
//     );
//   }

//   double getImageSize() {
//     if (screenWidth > 1600 && screenHeight > 800) {
//       return 350;
//     } else if (screenWidth > 1300 && screenHeight > 600) {
//       return 300;
//     } else if (screenWidth > 1000 && screenHeight > 400) {
//       return 200;
//     } else {
//       return 150;
//     }
//   }
// }
