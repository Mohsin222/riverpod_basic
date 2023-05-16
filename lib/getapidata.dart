import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app_with_river/api_data.dart';
import 'package:notes_app_with_river/notes_model.dart';
final apiData = StateNotifierProvider<ApiData , List<UserModel>>((ref) => ApiData());
class GetApiData extends ConsumerStatefulWidget {
  const GetApiData({super.key});

  @override
   ConsumerState<GetApiData> createState() => _GetApiDataState();
}

class _GetApiDataState extends  ConsumerState<GetApiData> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      ref.read(apiData.notifier).apifetchData();
    });
  }
  @override
  Widget build(BuildContext context ) {
      final notesList = ref.watch(apiData);
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
 await         HttpService.getPosts();  
          }, icon: Icon(Icons.add)),

          
        ],
        
      ),
      body:   notesList.isEmpty ?   const Text('Add notes ')
                :ListView.builder(
                  itemCount: notesList.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
return ListTile(
     title: Text(notesList[index].title),
                  subtitle: Text(notesList[index].title),

                  
);

                  }) ,
    );
  }
}