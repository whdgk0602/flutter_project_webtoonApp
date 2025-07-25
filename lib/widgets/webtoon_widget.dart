import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => DetailScreen(title: title, thumb: thumb, id: id),
            fullscreenDialog: true,
          ), //이는 플랫폼에 따라 다르게 작동
          // PageRouteBuilder(
          //   pageBuilder:
          //       (context, animation, secondaryAnimation) =>
          //           DetailScreen(title: title, thumb: thumb, id: id),
          //   transitionsBuilder: (
          //     context,
          //     animation,
          //     secondaryAnimation,
          //     child,
          //   ) {
          //     final offsetAnimation = Tween<Offset>(
          //       begin: Offset(0, 1),
          //       end: Offset.zero,
          //     ).animate(
          //       CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          //     );
          //     return SlideTransition(position: offsetAnimation, child: child);
          //   },
          //   transitionDuration: const Duration(milliseconds: 300),
          // ), 플랫폼에 따라 똑같은 동작
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(10, 10),
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ],
              ),
              child: Image.network(thumb),
            ),
          ),
          SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
