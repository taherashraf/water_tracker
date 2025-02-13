import 'package:flutter/material.dart';

class AddWaterBtn extends StatelessWidget {
  final int amount;
  IconData ? icon;
  final VoidCallback onClick;
 AddWaterBtn({
    super.key, required this.amount, required this.onClick, this.icon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: onClick,
          label: Text('+ ${amount} ml',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          icon: Icon(icon ?? Icons.water_drop,color: Colors.white,),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),
      ),
    );
  }
}