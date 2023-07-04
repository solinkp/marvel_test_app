import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:marvel_test/generated/l10n.dart';
import 'package:marvel_test/res/colors/colors.dart';
import 'package:marvel_test/view/layouts/widgets/custom_nav_destination.dart';

class DetailsLayout extends StatelessWidget {
  final String title;
  final Widget detailHeader;
  final Widget body;
  final int pageIndex;
  final Function(int) onDestinationSelected;

  const DetailsLayout({
    super.key,
    required this.title,
    required this.detailHeader,
    required this.body,
    required this.pageIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('detailsLayoutScaffold'),
      appBar: AppBar(
        title: Tooltip(
          message: title,
          triggerMode: TooltipTriggerMode.tap,
          child: Text(title),
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: marvelBlueGrey,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: marvelBlueGrey,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(flex: 3, child: detailHeader),
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: marvelGrey,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15.w,
                        right: 15.w,
                        top: 10.h,
                        bottom: 5.h,
                      ),
                      child: body,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: marvelBlueGrey,
        destinations: [
          CustomNavDestination(
            icon: Icons.now_wallpaper_rounded,
            label: S.current.comicNav,
          ),
          CustomNavDestination(
            icon: Icons.event_available_rounded,
            label: S.current.eventNav,
          ),
          CustomNavDestination(
            icon: Icons.movie_creation_outlined,
            label: S.current.serieNav,
          ),
          CustomNavDestination(
            icon: Icons.newspaper_rounded,
            label: S.current.storyNav,
          ),
        ],
        selectedIndex: pageIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
