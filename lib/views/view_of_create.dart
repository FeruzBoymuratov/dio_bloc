import 'package:flutter/material.dart';

Widget viewOfCreate(BuildContext context, TextEditingController _titleTextEditingController, TextEditingController _bodyTextEditingController, bool isLoading) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Title
            Container(
              height: 75,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(
                child: TextField(
                  controller: _titleTextEditingController,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10,),

            // Body
            Container(
              height: 475,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                controller: _bodyTextEditingController,
                style: TextStyle(fontSize: 18),
                maxLines: 30,
                decoration: InputDecoration(
                  labelText: 'Body',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),

      isLoading ? Center(child: CircularProgressIndicator(),) : SizedBox.shrink(),
    ],
  );
}