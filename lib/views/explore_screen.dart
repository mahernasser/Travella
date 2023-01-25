import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:kimit_tours/data/data.dart';
import 'package:kimit_tours/shared/drawer.dart';
import 'package:kimit_tours/views/attraction_details_screen.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../shared/constants.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final GlobalKey<SideMenuState> menuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: menuKey,
      background: secondaryColor,
      menu: const AppDrawer(),
      type: SideMenuType.shrinkNSlide,
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                final state = menuKey.currentState;
                if (state!.isOpened) {
                  state.closeSideMenu();
                } else {
                  state.openSideMenu();
                } // open side menu
              },
            ),
            title: const Text(
              'Egypt Attractions',
              style: TextStyle(
                fontFamily: 'oxygen',
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            )),
        body: ListView.builder(
          itemCount: attractions.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return Bounceable(
              onTap: () {},
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttractionDetailsScreen()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            attractions[index].imageUrl,
                            height: 110,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                attractions[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: AutoSizeText(
                                  attractions[index].description,
                                  style: const TextStyle(
                                      fontFamily: 'oxygen',
                                      color: Colors.grey,
                                      fontSize: 16),
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  TextButton(
                                    child:
                                        const Icon(Icons.arrow_right_rounded),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/attraction_details');
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
