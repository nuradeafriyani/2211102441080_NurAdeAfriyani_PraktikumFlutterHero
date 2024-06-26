import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.asset, required this.tag, required this.fullDesc});
  final String asset;
  final String tag;
  final String fullDesc;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: widget.tag,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(3),
              ),
              child: SizedBox(
                height: screenHeight / 2.2,
                width: screenWidth,
                child: Image.network(
                  widget.asset,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
              vertical: 20,
            ),
            child: Text(
              widget.tag,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
            ),
            child: Text(
              widget.fullDesc,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20,
              vertical: 20,
            ),
            child: const Text(
              "In-Stock",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 219, 82, 253),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}