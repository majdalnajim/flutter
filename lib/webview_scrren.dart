import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});



  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}
//
// class _WebViewScreenState extends State<WebViewScreen> {
//   InAppWebViewController ? webViewController;
//   late var url;
//   double webProgress = 0;
//   var urlcontroller = TextEditingController();
//   var initialUrl='https://www.hadaya.tech/';
//   var isLoading =false;
//
//
//
//   late ConnectivityResult result;
//   late StreamSubscription subscription;
//   var isConnected =false;
//
//
//   @override
//
//   void initState(){
//     super.initState();
//     startStreaming();
//   }
//
//  CheckInternet() async{
//    result = await Connectivity().checkConnectivity();
//
//    if(result!=ConnectivityResult.none){
//      isConnected = true;
//    }else{
//      isConnected=false;
//      showDialogBox();
//    }
//    setState(() {
//
//    });
//  }
//
//
//   showDialogBox() {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         insetPadding: EdgeInsets.zero,
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('images/errorImage.png'), // Replace with your image asset path
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         CheckInternet();
//                       },
//                       child: Text("Retry", style: TextStyle(
//                         color: const Color(0xFFCC2131),
//                       ),),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//  startStreaming(){
//    subscription=Connectivity().onConnectivityChanged.listen((event) async{
//      CheckInternet();
//
//    });
//  }
//
//
//
//   Future<bool> _goBack(BuildContext) async{
//     if(await webViewController!.canGoBack()){
//       webViewController!.goBack();
//       return Future.value(false);
//     }
//     else{
//       SystemNavigator.pop();
//       return Future.value(true);
//     }
//   }
//   Future<void> shouldOverrideUrlLoading(InAppWebViewController controller, Uri? url) async {
//     if (url != null) {
//       print('Current URL: ${url.toString()}');
//
//
//       if (url.toString().startsWith('https://www.hadaya.tech')) {
//
//         return;
//       } else {
//
//         if (await canLaunch(url.toString())) {
//           await launch(url.toString());
//         }
//
//         controller.stopLoading();
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: WillPopScope(
//         onWillPop: () => _goBack(context),
//         child: Column(
//           children: [
//             Expanded(child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 InAppWebView(
//                   onLoadStart:(controller,url)=>{
//
//                     shouldOverrideUrlLoading(controller, url),
//                   setState(() {
//                     CheckInternet();
//                   isLoading = true;
//                   })
//
//                   },
//
//                   onLoadStop:(controller,url) async{
//
//
//                     setState(() {
//                       isLoading = false;
//                     });
//
//                   },
//
//
//                 onWebViewCreated: (controller) => webViewController = controller,
//                 initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
//                   initialOptions: InAppWebViewGroupOptions(
//                     crossPlatform: InAppWebViewOptions(
//                       verticalScrollBarEnabled: false, // Disable vertical scroll
//                     ),
//                   ),
//
//                           ),
//
//                 Visibility(
//                     visible: isLoading,
//                     child: Container(
//                       height:75,
//                       width: 75,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("images/progress.gif")
//                         )
//                       ),
//                     )
//                 ),
//
//               ],
//             ),)],
//         ),
//       ),
//     );
//
//   }
// }
//
//
//
//
//
//
//
class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;
  late var url;
  double webProgress = 0;
  var urlcontroller = TextEditingController();
  var initialUrl = 'https://www.hadaya.tech/';
  var isLoading = false;

  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  @override
  void initState() {
    super.initState();
    startStreaming();
  }

  Future<bool> _goBack(BuildContext) async {
    if (await webViewController!.canGoBack()) {
      webViewController!.goBack();
      return Future.value(false);
    } else {
      SystemNavigator.pop();
      return Future.value(true);
    }
  }

  Future<void> shouldOverrideUrlLoading(
      InAppWebViewController controller, Uri? url) async {
    if (url != null) {
      print('Current URL: ${url.toString()}');

      if (url.toString().startsWith('https://www.hadaya.tech')) {
        return;
      } else {
        if (await canLaunch(url.toString())) {
          await launch(url.toString());
        }
        controller.stopLoading();
      }
    }
  }

  void startStreaming() {
    subscription =
        Connectivity().onConnectivityChanged.listen((event) async {
          CheckInternet();
        });
  }

  CheckInternet() async {
    result = await Connectivity().checkConnectivity();

    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      showDialogBox();
    }
    setState(() {});
  }

  showDialogBox() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/errorImage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        CheckInternet();
                      },
                      child: Text(
                        "Retry",
                        style: TextStyle(
                          color: const Color(0xFFCC2131),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => _goBack(context),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InAppWebView(
                    onLoadStart: (controller, url) {
                      shouldOverrideUrlLoading(controller, url);
                      setState(() {
                        CheckInternet();
                        isLoading = true;
                      });
                    },
                    onLoadStop: (controller, url) async {
                      setState(() {
                        isLoading = false;
                      });
                    },
                    onWebViewCreated: (controller) =>
                    webViewController = controller,
                    initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        verticalScrollBarEnabled: false,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/progress.gif")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
