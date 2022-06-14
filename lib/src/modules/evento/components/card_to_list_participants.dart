import 'package:flutter/material.dart';

class CardToListParticipants extends StatelessWidget {
  final String text;
  final VoidCallback addParticipant;
  final VoidCallback delParticipant;

  const CardToListParticipants({Key? key, required this.text, required this.addParticipant, required this.delParticipant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: 600,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: addParticipant,
                    icon: const Icon(Icons.add_reaction_rounded, color: Colors.lightGreen),
                  ),
                  IconButton(
                    onPressed: delParticipant,
                    icon: const Icon(Icons.delete, color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
