import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter/material.dart';

import '../cubit/astronaut_cubit.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<AstronautCubit>(context).getAstronoutDetails();
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(title: Text("OrBeat"),),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12.0,8.0,12.0,2.0),
          child: Column(
            children: [
               Padding(
                 padding: const EdgeInsets.only(bottom: 4.0),
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text("Craft Name",style: TextStyle(fontWeight: FontWeight.bold),), Text("Astronaut Name",style: TextStyle(fontWeight: FontWeight.bold))],),
               ),
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder<dynamic>(
                    future: BlocProvider.of<AstronautCubit>(context).getAstronoutDetails(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            var craft = snapshot.data![index]['craft'];
                            var name = snapshot.data![index]['name'];

                            return Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.green.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child:Row(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text(craft),Text(name)],)
                              )
                            );
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
