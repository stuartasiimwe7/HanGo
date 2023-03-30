import '../screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/constants.dart' as constants;
import 'login/signin_screen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: const Text("Community",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )
                      ),
                  background: Image.network(
                    "https://picsum.photos/id/200/300",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
          
        },
        body: Column(
          children: [
             const Text(constants.community),
             ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => const SignInScreen())));}, child: const Text('JOIN'))

          ],
        )

     ),
      );
  }
}
