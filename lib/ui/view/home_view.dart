import 'package:flutter/material.dart';
import 'package:todoapp/core/model/product.dart';
import 'package:todoapp/core/service/api_service.dart';
import 'package:todoapp/ui/shared/widgets/custom_card.dart';
import 'package:todoapp/ui/view/add_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ApiService service = ApiService.getInstance();
  List<Product> productList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
      ),
      floatingActionButton: _fabButton,
      body: FutureBuilder<List<Product>>(
        future: service.getProducts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              productList = snapshot.data;
              return _listView;
              break;
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }

  Widget get _listView => ListView.separated(
        itemBuilder: (context, index) => CustomCard(
          title: productList[index].productName,
          subtitle: "${productList[index].money}",
          imageUrl: productList[index].imageUrl,
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: productList.length,
      );

  Widget get _fabButton => FloatingActionButton(
        onPressed: fabPressed,
        child: Icon(Icons.add),
      );

  void fabPressed() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (context) => bottomSheet);
  }

  Widget get bottomSheet => Container(
        height: 100,
        child: Column(
          children: <Widget>[
            Divider(
              thickness: 2,
              indent: 100,
              endIndent: 100,
              color: Colors.grey,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddView(),
                  ),
                );
              },
              child: Text("Add Product"),
            )
          ],
        ),
      );
}
