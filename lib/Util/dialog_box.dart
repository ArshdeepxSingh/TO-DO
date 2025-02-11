import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller; 
  final VoidCallback onSave;
  final VoidCallback onCancel;


    const DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 233, 229, 223),
      content: SizedBox(
        height: 140 ,
        child: Column(

          children: [

            // take user input
            TextField(
              controller: controller ,
              decoration: InputDecoration(
                labelText: 'Add a new task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),


              ),

            
            ),
            SizedBox(height: 20),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // cancel task button
                TextButton(onPressed: onCancel, child: Text("Cancel")),






                // save task button

                TextButton(onPressed: onSave, child: Text("Save"))


              ],
            )

            




            
          ],
        )
      ),
    );
  }
}