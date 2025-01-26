import 'package:flutter/material.dart';

class IconLens extends StatefulWidget {
  const IconLens({super.key});

  @override
  State<IconLens> createState() => _IconLensState();
}

class _IconLensState extends State<IconLens> {
  int iscureentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ColorDialog();
          },
        );
      },
      child: Icon(
        Icons.color_lens_outlined,
        color: Colors.white,
      ),
    );
  }
}

class ColorDialog extends StatefulWidget {
  const ColorDialog({super.key});

  @override
  _ColorDialogState createState() => _ColorDialogState();
}

class _ColorDialogState extends State<ColorDialog> {
  int iscureentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Pick a Color",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                Color currentColor =
                    Colors.primaries[index % Colors.primaries.length];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      iscureentIndex = index;
                    });
                  },
                  child: Coloritem(
                    isActive: iscureentIndex == index,
                    color: currentColor,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.check, color: Colors.white),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Coloritem extends StatelessWidget {
  const Coloritem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 38,
          backgroundColor: color,
        ),
        if (isActive) // إذا كان اللون مختار نعرض علامة "صح"
          Icon(
            Icons.check,
            color: Colors.white,
            size: 24,
          ),
      ],
    );
  }
}
