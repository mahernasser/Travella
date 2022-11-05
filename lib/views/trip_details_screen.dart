import 'package:accordion/accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:readmore/readmore.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

import '../data/data.dart';
import '../shared/components.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollPageController pvController = ScrollPageController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                // IconButton(
                //   icon: customIcon(Icons.clear),
                //   onPressed: () {},
                // ),
                IconButton(
                  icon: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: 'Added to favourite!',
                      textColor: Colors.red,
                      backgroundColor: Colors.white,
                    );
                  },
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10),
              child: Container(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                alignment: Alignment.center,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Text(
                  tripList[1].title,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xffF5A31B),
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 900,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/2banner.jpg',
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                  titleBuilder(
                    'Tour Summary',
                    context,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  ReadMoreText(
                    tripList[1].description,
                    style: Theme.of(context).textTheme.displaySmall,
                    colorClickableText: const Color(0xffF5A31B),
                    trimCollapsedText: ' Read more',
                    trimExpandedText: ' Show less',
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: ScrollPageView(
                        controller: pvController,
                        children: tripList[2].tripImages.map((e) {
                          return Image.network(
                            e,
                            fit: BoxFit.cover,
                          );
                        }).toList(),
                      )),
                  const SizedBox(height: 15),
                  Accordion(
                      paddingBetweenOpenSections: 0,
                      paddingListBottom: 0,
                      paddingListTop: 0,
                      children: [
                        AccordionSection(
                            header: const Center(
                                child: Text(
                              'Trip Includes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'oxygen',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w800),
                            )),
                            content: Container(
                              height: 190,
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return includeItem(true,
                                      tripList[1].included[index], context);
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 5,
                                ),
                                itemCount: tripList[1].included.length,
                              ),
                            )),
                      ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Accordion(paddingListBottom: 0, paddingListTop: 0, children: [
                    AccordionSection(
                        header: const Center(
                            child: Text(
                          'Trip Excludes',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'oxygen',
                              fontSize: 19,
                              fontWeight: FontWeight.w800),
                        )),
                        content: SizedBox(
                          height: 180,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return includeItem(
                                  false, tripList[1].excluded[index], context);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 5,
                            ),
                            itemCount: tripList[1].excluded.length,
                          ),
                        )),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Accordion(paddingListBottom: 0, paddingListTop: 0, children: [
                    AccordionSection(
                        header: const Center(
                            child: Text(
                          'Trip Itinerary',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'oxygen',
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        )),
                        content: SizedBox(
                          height: 180,
                          child: ListView(
                              children: tripList[1].itinerary.map((e) {
                            return itinerary(e, context);
                          }).toList()),
                        )),
                  ]),
                  const SizedBox(
                    height: 190,
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 120,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
          ),
          onPressed: () {},
          child: const Text(
            'Book',
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                fontFamily: 'oxygen'),
          ),
        ),
      ),
    );
  }
}
