import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AweseomSnackBarContentPackage extends StatefulWidget {
  const AweseomSnackBarContentPackage({super.key});

  @override
  State<AweseomSnackBarContentPackage> createState() =>
      _AweseomSnackBarContentPackageState();
}

class _AweseomSnackBarContentPackageState
    extends State<AweseomSnackBarContentPackage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message:
                    'There is some information. You need to do something with that',
              ),
            );
            // const snackBar = SnackBar(
            //   /// need to set following properties for best effect of awesome_snackbar_content
            //   elevation: 0,
            //   behavior: SnackBarBehavior.floating,
            //   backgroundColor: Colors.transparent,
            //   content: AwesomeSnackbarContent(
            //     title: 'On Snap!',
            //     message:
            //         'This is an example error message that will be shown in the body of snackbar!',

            //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            //     contentType: ContentType.failure,
            //   ),
            // );

            // ScaffoldMessenger.of(context)
            //   ..hideCurrentSnackBar()
            //   ..showSnackBar(snackBar);
          },
          child: Text('SnackBar'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          child: const Text('Show Awesome Material Banner'),
          onPressed: () {
            const materialBanner = MaterialBanner(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              backgroundColor: Colors.transparent,
              forceActionsBelow: true,
              content: AwesomeSnackbarContent(
                title: 'Oh Hey!!',
                message:
                    'This is an example error message that will be shown in the body of materialBanner!',

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.success,
                // to configure for material banner
                inMaterialBanner: true,
              ),
              actions: [SizedBox.shrink()],
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentMaterialBanner()
              ..showMaterialBanner(materialBanner);
          },
        ),
      ],
    );
  }
}
