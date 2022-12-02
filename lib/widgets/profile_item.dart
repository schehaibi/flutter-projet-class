// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final int value;
  const ProfileItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const SizedBox(
          height: 5,
        ),
        Text(
          value.toString(),
        ),
      ],
    );
  }
}
