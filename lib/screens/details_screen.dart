import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Result movie = ModalRoute.of(context)!.settings.arguments as Result;
    print(movie.title);


    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              CastingCards(),
            ]),
          )
        ],
      )
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ut vulputate velit. Integer eget cursus magna, sagittis suscipit magna. Suspendisse vestibulum sapien sit amet ipsum congue gravida ut a lacus. Fusce lorem orci, commodo at fringilla a, tristique id leo. Integer sodales cursus nisl nec congue. Sed semper hendrerit augue vel lacinia. Integer vehicula nunc sit amet efficitur dignissim. Nunc non quam nunc. ",
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme= Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal:20.0 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: const FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"),
              image: NetworkImage("https://via.placeholder.com/300x400"),
              height: 150,
            ),
          ),
          const SizedBox(width: 20.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "title.movie",
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "title.movie",
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis
              ),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15,color: Colors.grey,),
                  const SizedBox(width: 10.0,),
                  Text("movie.voteAverage",style:textTheme.caption)
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0.0),
        title: Container(
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          child: const Text(
            "movie.title",
            style: TextStyle(fontSize: 16),
          )
        ),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}