import 'package:flutter/material.dart';
import '../widgets/constants.dart' as constants;

class OthersScreen extends StatelessWidget {
  const OthersScreen({super.key});
 
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
                  title: const Text("Others",
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
      body: SingleChildScrollView(
        child: Stack(
          children: const [
              Text(constants.others),
          ],
        ),
      )
     )  
    );
  }
}
