import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
   
  const CastingCards({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0, top: 30.0,left: 20.0),
      width: double.infinity,
      height: 225.0,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) => const _CastCard()
      
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({
    Key? key,
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
            child: const FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"),
              image: NetworkImage('https://picsum.photos/200/300'),
              width: 140.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox( height:  5.0 ,),
          const Text(
            "Un actor",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}