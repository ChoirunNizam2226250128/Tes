import 'package:flutter/material.dart';
import 'package:pertemuan_11/widgets/profile_info_item.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasi Variabel yang dibutuhkan
  bool isSignedIn = true;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  // TODO: 5. Implementasi fungsi signIn
  void signIn() {
    // setState(() {
    //   isSignedIn = !isSignedIn;
    // });
    Navigator.pushNamed(context, '/signin');
  }

  // TODO: 5. Implementasi fungsi signOut
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          // TODO: 2. Buat bagian ProfileHeader yang berisi gambar profil
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 200 - 50),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2),
                                  shape: BoxShape.circle),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('images/place-holder.jpg'),
                              ),
                            ),
                            if (isSignedIn)
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.deepPurple[50],
                                ),
                              ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ProfileInfoItem(
                      icon: Icons.lock,
                      label: 'Pengguna',
                      value: userName,
                      iconColor: Colors.amber),

                  const SizedBox(
                    height: 4,
                  ),
                  Divider(
                    color: Colors.deepPurple[100],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ProfileInfoItem(
                    icon: Icons.person,
                    label: 'Nama',
                    value: fullName,
                    iconColor: Colors.blue,
                    showEditor: isSignedIn,
                    onEditPressed: () {
                      debugPrint('Icons edit Ditekan');
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Divider(
                    color: Colors.deepPurple[100],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ProfileInfoItem(
                      icon: Icons.favorite,
                      label: 'Favorite',
                      value:
                          favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                      iconColor: Colors.red),
                  // TODO: 4. Buat ProfileActions yang berisi TextButton sign in/out
                  const SizedBox(
                    height: 4,
                  ),
                  Divider(
                    color: Colors.deepPurple[100],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isSignedIn
                      ? TextButton(
                          onPressed: signOut, child: const Text('Sign Out'))
                      : TextButton(
                          onPressed: signIn, child: const Text('Sign In'))
                ],
              ))
        ],
      ),
    );
  }
}