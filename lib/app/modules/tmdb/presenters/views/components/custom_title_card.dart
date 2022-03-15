import 'package:flutter/material.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/entities/results_entity.dart';

class CustomTitleCards extends StatelessWidget {
  final double width;
  final double height;
  final ResultEntity? result;
  final void Function()? onTap;
  final void Function()? favoriteButton;
  final IconData? favoriteIcon;

  const CustomTitleCards(
      {Key? key,
      this.width = 264,
      this.height = 100,
      required this.result,
      this.onTap, this.favoriteButton, this.favoriteIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xff0F1122),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: constraints.maxWidth * 0.29,
                height: constraints.minHeight,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/original/${result?.backDropPath}"),
                  ),
                ),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${result?.title}",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Type: ${result?.mediaType}",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Language: ${result?.language}",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: favoriteButton,
                      child: Icon(
                        favoriteIcon,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: constraints.maxWidth * 0.13,
                      height: constraints.maxHeight * 0.22,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        color: Colors.amber,
                      ),
                      child: Text("${result?.voteAverage}"),
                    )
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
