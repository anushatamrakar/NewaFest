import 'package:flutter/material.dart';
class ImageUpload extends StatefulWidget {
  final VoidCallback onTap;
  const ImageUpload({super.key, required this.onTap});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              size: 50,
              color: Colors.grey,
            ),
            SizedBox(height: 10),
            Text(
              "Add Cover Photo",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "(up to 12 Mb)",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
