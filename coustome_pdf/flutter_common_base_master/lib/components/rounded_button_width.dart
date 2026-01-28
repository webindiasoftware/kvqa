import 'package:flutter/material.dart';



class RoundedButtonWidth extends StatelessWidget {

  final VoidCallback callback;
  final String title;
  final Color color;
  final Color textColor;
  const RoundedButtonWidth({Key? key, required this.callback, required this.title,required this.color,required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      width: sizeWidth*0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)
              ),
            ),
            // <-- Radius
            backgroundColor: color,),
          onPressed: callback,
          child: Text(
            title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:textColor ?? Colors.white),
          ),
        )),
    );
  }
}
