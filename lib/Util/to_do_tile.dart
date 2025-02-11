// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onToggle; 
  Function(BuildContext)? onDelete;




  ToDoTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onToggle,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), 
        
        children: [
          Theme(
            data: Theme.of(context).copyWith(
                  outlinedButtonTheme: const OutlinedButtonThemeData(
                    style: ButtonStyle(
                      iconColor:  WidgetStatePropertyAll(Colors.white)
                    )
                  )
                ),
            
            child: SlidableAction(onPressed: onDelete  , backgroundColor: Colors.red , icon: Icons.delete , borderRadius: BorderRadius.circular(12),))
        ]) ,
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                // check box
                Checkbox(
                  value: isCompleted,
                  onChanged: onToggle,
                  activeColor: Color.fromARGB(255, 17, 16, 18),
                ),
        
                // content
                Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 15,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            )),
      ),
    );
  }
}
