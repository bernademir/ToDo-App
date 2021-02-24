import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  GlobalKey<FormState> formKey = GlobalKey(debugLabel: "formKey");

  String validator(val) {
    if (val.isEmpty) {
      return "Please enter a value";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidate: true,
        key: formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Product Name",
                  ),
                  validator: this.validator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Price",
                  ),
                  validator: this.validator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Image",
                  ),
                  validator: this.validator,
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  label: Text("Add"),
                  shape: StadiumBorder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
