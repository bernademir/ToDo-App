import 'package:flutter/material.dart';
import 'package:todoapp/ui/shared/widgets/custom_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
      ),
      floatingActionButton: _fabButton,
      body: ListView.separated(
          itemBuilder: (context, index) => CustomCard(
                title: "berna",
                subtitle: "$index",
                imageUrl: "",
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 5),
    );
  }

  Widget get _fabButton {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }
}
