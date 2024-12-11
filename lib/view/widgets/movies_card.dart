import 'package:flutter/material.dart';
import 'package:movienest/data/models/movies_model.dart';

class MoviesCard extends StatelessWidget {
  MoviesCard({super.key, required this.movie});

  Results movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(3),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            movie.title.toString(),
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: Colors.grey,
          child: Image.network(
            "https://image.tmdb.org/t/p/original/${movie.posterPath!}",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
