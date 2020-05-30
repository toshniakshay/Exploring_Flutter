import 'package:flutter/material.dart';
import 'package:userregistration/utils/Helper.dart';

class ListWidget extends StatelessWidget {
  final String dialogTitle;
  final List<String> optionsList;
  // Keeping it as not required so that
  // if some widgets don't want to handle click they can work with this widget
  final Function getSelectedItem;

  ListWidget({@required this.optionsList, @required this.dialogTitle, this.getSelectedItem });

  @override
  Widget build(BuildContext context) {
    return  Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 16,
      child: Container(
        height: 400.0,
        width: 360.0,
        child: ListView.builder(
            itemCount: optionsList == null ? 1 : optionsList.length + 1,
            itemBuilder: _buildProductItem
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    if(index == 0) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            dialogTitle,
            style: TextStyle(fontSize: 24, color: Helper.getColorFromHex("#408ECE"), fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    index = index - 1;

    return GestureDetector(
      onTap: ()=> { getSelectedItem(optionsList[index])},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 12),
            Text(
              optionsList[index],
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Container(height: 1, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
