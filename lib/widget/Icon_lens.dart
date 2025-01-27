import 'package:flutter/material.dart';
import 'package:note/widget/constet.color.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });

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
        if (isActive)
          const Icon(
            Icons.check,
            color: Colors.white,
            size: 30,
          ),
      ],
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 300,
              child: GridView.builder(
                itemCount: kColors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: ColorItem(
                      color: kColors[index],
                      isActive: currentIndex == index,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, kColors[currentIndex]);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kColors[currentIndex],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Done",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
