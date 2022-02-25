import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orbeat/models/people_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

part 'astronaut_state.dart';

class AstronautCubit extends Cubit<AstronautState> {
  AstronautCubit() : super(AstronautInitial());

  getAstronoutDetails()async{
    var response=await http.get(Uri.http("api.open-notify.org", "astros.json"));
    var jsonData=convert.jsonDecode(response.body)["people"];
    print("Astronaut results");
    print(jsonData);
    return jsonData;
  }

  fetchAstronautDetails(){
     getAstronoutDetails().then((astronautDetails){
       emit(DetailsLoaded(astronautDetails:astronautDetails));
     }

     );
  }
}
