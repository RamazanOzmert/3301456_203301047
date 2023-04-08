import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({Key? key, required this.btnLabel}) : super(key: key);
  final String btnLabel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        minimumSize: const Size(0, 0),
        textStyle: Theme.of(context).textTheme.bodySmall,
      ),
      onPressed: () {
        //func
      },
      child: Text(
        btnLabel,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.blue,
        ),
      ),
    );
  }
}
