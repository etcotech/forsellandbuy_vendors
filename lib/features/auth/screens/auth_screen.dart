import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixvalley_vendor_app/localization/language_constrants.dart';
import 'package:sixvalley_vendor_app/features/auth/controllers/auth_controller.dart';
import 'package:sixvalley_vendor_app/utill/dimensions.dart';
import 'package:sixvalley_vendor_app/utill/images.dart';
import 'package:sixvalley_vendor_app/utill/styles.dart';
import 'package:sixvalley_vendor_app/features/auth/screens/login_screen.dart';



class AuthScreen extends StatelessWidget{
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthController>(context, listen: false).isActiveRememberMe;
    return Scaffold(
      backgroundColor: const Color(0xffF2F5F9),
      appBar: AppBar(
        title: Text("${getTranslated('login', context)}"),
        centerTitle: true,
      ),
      body: Consumer<AuthController>(
        builder: (context, auth, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Align(alignment: Alignment.topCenter,
                        child: Padding(
                          padding:  EdgeInsets.only(top : MediaQuery.of(context).size.height/25,
                          bottom: 38),
                          child: Column( children: [
                              Hero( tag: 'logo',
                                  child: Padding(
                                    padding: const EdgeInsets.only(top : Dimensions.paddingSizeExtraLarge),
                                    child: Material(
                                      elevation: 2.0,
                                      borderRadius: BorderRadius.circular(20),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(Images.logo,width: 120)),
                                    ),
                                  )),
                              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Text(getTranslated('seller', context)!,
                                    style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeExtraLargeTwenty, color: Theme.of(context).textTheme.bodyLarge?.color)),
                                  // const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                                  // Text(getTranslated('app', context)!,
                                  //     style: robotoMedium.copyWith(color: Theme.of(context).primaryColor,
                                  //         fontSize: Dimensions.fontSizeExtraLargeTwenty)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],),

                    // Padding( padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                    //   child: Text(getTranslated('login', context)!,
                    //     style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeOverlarge, color: Theme.of(context).textTheme.bodyLarge?.color))),

                    Padding( padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeSmall),
                      child: Text(getTranslated('manage_your_business_from_app', context)!,
                        style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).hintColor)),
                    ),

                    const SizedBox(height: Dimensions.paddingSizeLarge),

                    const LoginScreen()

                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}



