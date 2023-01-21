import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
   
  const MovieSlider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Populares", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
          ),
          const SizedBox( height:  15.0 ,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) => const _MoviePoster()
            ),
          )
        ],
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {
   
  const _MoviePoster({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 190.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments: 'movie'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: const FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130.0,
                height: 190.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox( height:  5.0 ,),
          const Text(
            "Una pelicula",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}