import 'package:flutter/material.dart';

import '../../api/mock_fooderlich_service.dart';
import '../../components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        // 3
        builder: (context, AsyncSnapshot snapshot) {
          //4
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
                //6
                scrollDirection: Axis.vertical,
                children: [
                  //7
                  TodayRecipeListView(recipes: snapshot.data?.todayRecipes),
                  //8
                  const SizedBox(height: 16),
                  //9
                  FriendPostlistView(friendPosts: snapshot.data?.friendPosts),
                ]);
          } else {
            //10
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
