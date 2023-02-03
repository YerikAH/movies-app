import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import '../widgets/widgets.dart';
import 'package:movies_app/theme/app_theme.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Result movie = ModalRoute.of(context)!.settings.arguments as Result;
    print(movie.title);


    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(backdropImage: movie.fullBackdropPath, titleMovie: movie.title,),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(image: movie.fullPosterImg, titleMovie: movie.title!, voteMovie: movie.voteAverage!, movieText: movie.originalTitle!,),
              _Overview(descriptionMovie: movie.overview!,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text("Actors",style: Theme.of(context).textTheme.headline5,)
                ),
              CastingCards( movieId: movie.id!,),
            ]),
          )
        ],
      )
    );
  }
}

class _Overview extends StatelessWidget {
  final String descriptionMovie;
  const _Overview({
    Key? key, required this.descriptionMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
      child: Text(descriptionMovie,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final String titleMovie;
  final String movieText;
  final double voteMovie;
  final String image;
  const _PosterAndTitle({
    Key? key, required this.image, required this.titleMovie, required this.voteMovie, required this.movieText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme= Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal:20.0 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: FadeInImage(
              placeholder: const AssetImage("assets/no-image.jpg"),
              image: NetworkImage(image),
              height: 150,
            ),
          ),
          const SizedBox(width: 20.0,),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieText,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    titleMovie,
                    style: textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_outline, size: 15,color: Colors.grey,),
                      const SizedBox(width: 10.0,),
                      Text("$voteMovie",style:textTheme.caption,)
                    ],
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
    final String backdropImage;
    final String? titleMovie;
  const _CustomAppBar({
    Key? key, required this.backdropImage, required this.titleMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.black,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0.0),
        title: Container(
          width: double.infinity,
          color: Colors.black38,
          alignment: Alignment.bottomCenter,
          child: Text(
            titleMovie!,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          )
        ),
        background: FadeInImage(
          placeholder: const AssetImage("assets/loading.gif"),
          image: NetworkImage(backdropImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
