import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xgrosr/GraphQL/services.dart';
import 'package:xgrosr/bloc/category_bloc.dart';

class CategoryScreen extends StatefulWidget{
  @override
  _CategoryScreen createState() => _CategoryScreen();
}
class _CategoryScreen extends State<CategoryScreen>{


  // void initalState(){
  //   super.initState();
  //   BlocProvider.of<CategoryBloc>(context)..add(
  //     CategoryOpened()
  //   );
    
  // }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Categories'),),
      body: BlocListener<CategoryBloc,CategoryState>(
        listener: (context,state){
          print(state);
          if(state is CategoryLoad){
            print(state.categories);
          }
        },

        child: BlocBuilder<CategoryBloc,CategoryState>(
          builder: (context,state){
            if(state is CategoryLoading){
              return CircularProgressIndicator();
            }
            else if(state is CategoryLoad){
              // return Center(child: Text("Loaded"),);
              // state.model.
              // return ListView.builder(
              //   itemCount: state.categories.length,
              //   itemBuilder: (context,index){
              //     return ListTile(
              //       title: Text(state.categories[index].name),
              //     );
              //   }
              // );

              return Container(
                child: GridView.count(
                  shrinkWrap: true,

                  crossAxisCount: 3,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List.generate(state.categories.length, (index){
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:Colors.white,
                          // borderRadius: BorderRadius.circular(5),
                        // border: Border.all(color:Colors.grey,width: 0.2)
                      ),
                      child: Column(children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: server_url+'/media/'+state.categories[index].imgUrl,
                          height: 110,
                          // height: ,
                          fit: BoxFit.fill,
                          errorWidget: (context,url,error) => Center(child: Text("Image Not Found",style: TextStyle(color:Colors.grey),),),
                          placeholder: (context, url) =>Center(child: CircularProgressIndicator()),
                        ),
                        // Text(server_url+'/media/'+state.categories[index].imgUrl)
                        
                        // Text(state.categories[index].name)
                      ],),

                    );

                  }
                  ),
              )
              );
            }
            else{
              // print("XXX");
              return Center(child: Text("something went wrong"),);
              
            }
          },
        ),

      )
    
    );
  }
}