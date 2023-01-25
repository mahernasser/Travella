import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kimit_tours/shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).maybePop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          'Contact with us',
          style: TextStyle(fontFamily: 'oxygen'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/contact_us_vector.jpg',
                    scale: 9.1,
                  )),
              TextField(
                style: const TextStyle(fontFamily: 'oxygen', fontSize: 15),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusColor: Colors.indigo,
                  hintText: 'Email Address',
                  prefixIcon: const Icon(Icons.email),
                  hintStyle:
                      const TextStyle(fontSize: 15, fontFamily: 'oxygen'),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: const TextStyle(fontFamily: 'oxygen', fontSize: 15),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusColor: Colors.indigo,
                  hintText: 'Subject',
                  prefixIcon: const Icon(Icons.subtitles),
                  hintStyle:
                      const TextStyle(fontSize: 15, fontFamily: 'oxygen'),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                style: const TextStyle(fontFamily: 'oxygen', fontSize: 15),
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  focusColor: Colors.indigo,
                  hintText:
                      'Text us with your problem and we will answer you as soon as possible.',
                  hintStyle:
                      const TextStyle(fontSize: 15, fontFamily: 'oxygen'),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            backgroundColor: secondaryColor.withOpacity(.8),
                            msg:
                                'Thank you for your feedback we will call you soon');
                      },
                      child: const Text('Send'))
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.grey,
                    height: 1,
                    width: double.infinity,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.white,
                    child: const Text(
                      'Or call us',
                      style: TextStyle(fontSize: 20, fontFamily: 'oxygen'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      whatsContact();
                    },
                    icon: const Icon(
                      Icons.whatsapp_rounded,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      fbContact();
                    },
                    icon: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      gmailContact();
                    },
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Colors.red,
                      size: 50,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  whatsContact() async {
    const whatsappUrl = "https://api.whatsapp.com/send?phone=+201091263985";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw "Couldn\'t launch url";
    }
  }

  fbContact() async {
    const fbUrl = "https://www.facebook.com/krym.zyad.9";
    if (await canLaunch(fbUrl)) {
      await launch(fbUrl);
    } else {
      throw "Couldn\'t launch url";
    }
  }

  gmailContact() async {
    final Uri emailUrl = Uri(
        scheme: 'mailto',
        path: 'kemet.tours.egypt@gmail.com',
        queryParameters: {'subject': 'Inquiry_about_something'});
    if (await canLaunchUrl(emailUrl)) {
      await launchUrl(emailUrl);
    } else {
      throw 'Cannot launch gmail';
    }
  }
}
