import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app_with_river/notes_model.dart';

class NotifierProv extends  StateNotifier<List<Notes>>{


  NotifierProv() : super([]);

  void addNotes(Notes note){
    state = [...state ,note];
  }

  void removeNotes(Notes note){
    state = state.where((element) => element !=note).toList();
  }

}