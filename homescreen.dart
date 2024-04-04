import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod_app/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userNum = '1';
  @override
  //WidgetRef allows widgets to communicate with other Providers.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 124, 160, 160),
        title: const Text('My App'),
        elevation: 4,
      ),
      body:  Consumer(

        //this method makes sure only the part that wants the provider value is rebuilt and not the whole thing.
        builder: (context, ref, child) {

          final user = ref.watch(fetchUserProvider(userNum));
          // final user = ref.watch(userProvider); //rebuilds when either name or age changes
          // final user = ref.watch(userProvider.select((value) => value.name)); //rebuilds only when the name changes
          return user.when(data: (data){
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  elevation: 1,
                  color: const Color.fromARGB(160, 187, 192, 192),
                  child: SizedBox(

                    width: MediaQuery.sizeOf(context).width*0.92,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                      hintText: 'id',
                                      hintStyle: TextStyle(
                                          fontSize: 12
                                      )
                                  ),
                              onFieldSubmitted: (value){
                                setState(() {
                                  userNum = value;
                                });
                              },
                            ),
                          ),
                          Text("name : ${data.name}",style: TextStyle(fontSize: 25),),
                          Text("email : ${data.email}",style: TextStyle(fontSize: 25),)
                          // TextFormField(
                          //   keyboardType: TextInputType.text,
                          //   decoration: const InputDecoration(
                          //       hintText: 'Name',
                          //       hintStyle: TextStyle(
                          //           fontSize: 12
                          //       )
                          //   ),
                          //   onChanged: (value){
                          //     // ref.read(userProvider.notifier).updateName(value); //here we have access to updateName fn
                          //   },
                          // ),
                          // TextFormField(
                          //   keyboardType: TextInputType.number,
                          //   decoration: const InputDecoration(
                          //       hintText: 'Age',
                          //       hintStyle: TextStyle(
                          //           fontSize: 12
                          //       )
                          //   ),
                          //   onChanged: (value){
                          //     // ref.read(userProvider.notifier).updateAge(int.parse(value));
                          //   },
                          // ),
                          // const Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       // Text(user.name),
                          //       // Text(user.age.toString())
                          //     ],
                          //   ),
                          // )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }, error: (error, stackTrace){
            return Center(
              child: Text(error.toString())
            );
          }, loading: (){
            return Center(child: CircularProgressIndicator());
          });


        }
      ),
    );
  }
}
