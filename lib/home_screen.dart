import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app_with_river/notes_model.dart';


import 'notes_notifier.dart';


final noteProvider = StateNotifierProvider<NotifierProv , List<Notes>>((ref) => NotifierProv());

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
        final titleController = TextEditingController();
    final contentController = TextEditingController();
        final notesList = ref.watch(noteProvider);
    return Scaffold(
        appBar: AppBar(
        title: const Text('Notes App'),
      ),
      body: Column(children: [

        ElevatedButton(onPressed: (){
 showDialog(context: context, builder: (_){
  return  AlertDialog(
    content: Column(
children: [
     TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                        TextField(
                      controller: contentController,
                      decoration: InputDecoration(
                        labelText: 'Content',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
],

      
    ),
    actions: [
      ElevatedButton(onPressed: (){

        ref.read(noteProvider.notifier).addNotes(Notes(title: titleController.text.trim(), content: contentController.text.trim()));
        Navigator.pop(context);
     
      },child: Text('ADD NOTES'),)
    ],
  );
 });

        }, child: const Text('Add note')),


                const SizedBox(height: 20),

                notesList.isEmpty ?   const Text('Add notes ')
                :ListView.builder(
                  itemCount: notesList.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
return ListTile(
     title: Text(notesList[index].title),
                  subtitle: Text(notesList[index].content),

                  trailing: IconButton(onPressed: (){
                    ref.read(noteProvider.notifier).removeNotes(notesList[index]);
                  }, icon: Icon(Icons.delete,color: Colors.red,)),
);

                  })
      ]),
    );
  }
}