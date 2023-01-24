import 'package:flutter/material.dart';
import '../models/models.dart';

class MovieSlider extends StatefulWidget {
   final List<Result> moviesPopular;
   final Function onNextPage;
  const MovieSlider({Key? key, required this.moviesPopular, required this.onNextPage}) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState(){
    super.initState();
    print("HOla mundo");
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent){
        print("Obejetener la siguiente pagina");
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose(){
    super.dispose();
  }


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
            child: Text("Populares", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: "NunitoSans")),
          ),
          const SizedBox( height:  15.0 ,),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.moviesPopular.length,
              itemBuilder: (context, index){

                final String imagePath = widget.moviesPopular[index].fullPosterImg;
                final String nameMovie = widget.moviesPopular[index].thereTitle;
                return  _MoviePoster(imagePath: imagePath, nameMovie: nameMovie,);
              }
            ),
          )
        ],
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {
   final String imagePath;
   final String nameMovie;
  const _MoviePoster({Key? key, required this.imagePath, required this.nameMovie}) : super(key: key);
  
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
              child: FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"),
                image: NetworkImage(imagePath),
                width: 130.0,
                height: 190.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox( height:  5.0 ,),
          Text(
            nameMovie,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}