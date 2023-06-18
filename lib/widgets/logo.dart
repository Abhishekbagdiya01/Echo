import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import '../utils/colors.dart';

// class EchoLogo extends StatelessWidget {
//   EchoLogo({
//     required this.titleSize,
//     required this.descSize,
//     this.height,
//     super.key,
//   });
//   double titleSize;
//   double descSize;

//   double? height;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: height ?? 50,
//             child: ShaderMask(
//               blendMode: BlendMode.srcIn,
//               shaderCallback: (Rect bounds) {
//                 return LinearGradient(
//                   colors: [topLogoColor, bottomLogoColor],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ).createShader(bounds);
//               },
//               child: Text(
//                 "ECHO",
//                 style: TextStyle(
//                   fontFamily: "Cookie-Regular",
//                   fontSize: titleSize,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//             child: ShaderMask(
//               blendMode: BlendMode.srcIn,
//               shaderCallback: (Rect bounds) {
//                 return LinearGradient(
//                   colors: [topLogoColor, bottomLogoColor],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ).createShader(bounds);
//               },
//               child: Text(
//                 "the Unwritten.Share the Unheard",
//                 style: TextStyle(
//                   fontFamily: "Cookie-Regular",
//                   fontSize: descSize,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class EchoLogo extends StatelessWidget {
  const EchoLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset("assets/images/echo-logo.svg"),
    );
  }
}
