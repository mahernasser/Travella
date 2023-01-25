import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            SizedBox(
              height: 190,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/1369212/pexels-photo-1369212.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  CircularProfileAvatar(
                    'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
                    initialsText: Text('hello'),
                    child: Image.network(
                      'https://i.ibb.co/R24MDh7/39776a9e-2a11-4021-b7dd-9aca8a1360d9.jpg',
                      fit: BoxFit.cover,
                    ),
                    borderWidth: 3,
                    borderColor: Colors.white,
                    radius: 53,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Dr/ Kamal Hefny',
              style: TextStyle(
                  fontSize: 21,
                  fontFamily: 'oxygen',
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'An academic professor at New Cairo Academy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'oxygen',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [Text('100'), Text('Posts')],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [Text('100'), Text('Posts')],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [Text('100'), Text('Posts')],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [Text('100'), Text('Posts')],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 42,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('EDIT PROFILE'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
