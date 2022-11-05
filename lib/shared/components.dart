import 'package:flutter/material.dart';

import '../models/models.dart';
import '../views/trip_details_screen.dart';

Widget catItem({
  required CategoryModel model,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: 150,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF5A31B),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              model.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'oxygen',
              ),
            ),
            Image.asset(
              model.imageUrl,
              width: 26,
              height: 26,
            )
          ],
        ),
      ),
    ),
  );
}

Widget popularItem(MostPopular model, context) {
  return Card(
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    shadowColor: Colors.white,
    elevation: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            model.imageUrl,
            width: 140,
            fit: BoxFit.cover,
            height: 130,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Text(
                model.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.2,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'oxygen'),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xffF5A31B),
                  ),
                  const SizedBox(width: 3),
                  Text(model.location,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 18,
                          fontFamily: 'oxygen'))
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
/*
*
*/

Widget drawerMenu() {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 50.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22.0,
              ),
              SizedBox(height: 16.0),
              Text(
                "Hello, John Doe",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
          title: const Text("Home"),
          textColor: Colors.white,
          dense: true,
        ),
        ExpansionTile(
          title: const Text(
            'ExpansionTile 1',
          ),
          subtitle: const Text('Trailing expansion arrow icon'),
          children: <Widget>[
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.monetization_on,
                  size: 20.0, color: Colors.white),
              title: const Text("Tour Packages"),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.shopping_cart,
                  size: 20.0, color: Colors.white),
              title: const Text("Short excursions"),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.star_border,
                  size: 20.0, color: Colors.white),
              title: const Text("Favorites"),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {},
              leading:
                  const Icon(Icons.settings, size: 20.0, color: Colors.white),
              title: const Text("Settings"),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget titleBuilder(String text, context) {
  return Text(text, style: Theme.of(context).textTheme.titleMedium);
}

Widget tripCard({
  required Trip tripModel,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TripDetailsScreen()));
    },
    child: Card(
      shadowColor: Theme.of(context).errorColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                child: Image.network(
                  tripModel.featureImgUrl,
                  height: 250,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        stops: const [0.4, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ])),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 250,
                alignment: Alignment.bottomLeft,
                child: Text(
                  tripModel.title,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money_rounded,
                      color: Color(0xffF5A31B),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      tripModel.price.toString(),
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_city,
                      color: Color(0xffF5A31B),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${tripModel.cities} cities',
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.today_sharp,
                      color: Color(0xffF5A31B),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      tripModel.duration,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget categoryItem({
  required Category categoryModel,
}) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.network(
          categoryModel.imageUrl,
          fit: BoxFit.cover,
          height: 250,
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(18)),
        alignment: Alignment.center,
        height: 250,
        child: Text(
          categoryModel.title,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontFamily: 'oxygen'),
        ),
      )
    ],
  );
}

Widget customIcon(IconData icon, {Color? color}) {
  return CircleAvatar(
    backgroundColor: Colors.white,
    child: Icon(
      icon,
      color: color ?? Colors.grey,
    ),
  );
}

Widget includeItem(bool i, String title, BuildContext context) {
  return ListTile(
    leading: Icon(
      i ? Icons.done : Icons.clear,
      color: i ? Colors.green : Colors.red,
    ),
    title: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(color: Colors.black),
    ),
  );
}

Widget itinerary(String title, BuildContext context) {
  return ListTile(
    leading: const Icon(Icons.edit_location),
    title: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(color: Colors.black),
    ),
  );
}

Widget customField({
  required BuildContext context,
  String? label,
  String? hintText,
  required IconData prefixIcon,
  suffixIcon,
  required String? Function(String?) validator,
  required TextEditingController controller,
  onTap,
  TextStyle? labelStyle,
  bool? isVisible,
  bool? readOnly,
  TextInputType? inputType,
  border,
}) {
  return TextFormField(
    readOnly: readOnly ?? false,
    obscureText: isVisible ?? false,
    onTap: onTap,
    controller: controller,
    validator: validator,
    keyboardType: inputType,
    decoration: InputDecoration(
      labelStyle: labelStyle ??
          const TextStyle(
              fontFamily: 'oxygen',
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: Color(0xFF113861)),
      focusColor: Colors.orange,
      hoverColor: Colors.orange,
      border: border ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
          ),
      labelText: label,
      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon,
    ),
    style: const TextStyle(
        color: Color(0xFF113861), fontSize: 16, fontFamily: 'oxygen'),
  );
}

void navigateReplacement({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}
