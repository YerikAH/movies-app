import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/movie_provider.dart';

class CastingCards extends StatelessWidget {
   final int movieId;
  const CastingCards({Key? key, required this.movieId}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context,listen: true);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: ( _, AsyncSnapshot <List<Cast>> snapshot){
        if ( !snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 300.0),
            height: 100,
            child: const CupertinoActivityIndicator()
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 20.0, top: 30.0,left: 20.0),
          width: double.infinity,
          height: 225.0,
          child: ListView.builder(
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) => _CastCard(nameAct: cast[index].name, photoAct: cast[index].fullProfileImg,)
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final String photoAct;
  final String nameAct;
  const _CastCard({
    Key? key, required this.photoAct, required this.nameAct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0,),
      width: 110.0,
      height: 100.0,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: const AssetImage("assets/no-image.jpg"),
              image: NetworkImage(photoAct),
              width: 140.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox( height:  5.0 ,),
          Text(
            nameAct,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}