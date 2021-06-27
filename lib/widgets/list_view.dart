import 'package:flutter/material.dart';

Widget ListViewSeparated({required int itemCount, }) {
  return ListView.separated(
    itemCount: itemCount,
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
        return ListViewSeparated(itemCount: itemCount);
    },
  );
}