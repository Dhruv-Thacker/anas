// import 'package:campusbuzz/event_list.dart';
// import 'package:campusbuzz/event_detail_screen.dart';
// import 'package:campusbuzz/explore_page/explore_page.dart';
// import 'package:flutter/material.dart';
// import 'package:campusbuzz/model/event.dart';
// class Explore extends StatelessWidget {
//     Explore ({super.key,this.title,required this.event,});

//   final String? title;
//   final List<Event> event;
//   // final void Function(Event event) onToggleFavorite;

//   void selectEvent(BuildContext context, Event event) {
//     //Navigator.of(context).pop(); //not required
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => EventDetailScreen(
//           event: event,
//           // onToggleFavorite: onToggleFavorite,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     Widget content = const Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//             Text(
//               'Uh oh ... nothing here!',
//               style:TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Color(0xffE93030))
//             ),
          
//           //const SizedBox(height: 16),
//           // Text(
//           //   'Try selecting a different category!',
//           //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//           //         color: Theme.of(context).colorScheme.onBackground,
//           //       ),
//           // ),
//         ],
//       ),
//     );

//     if (event.isNotEmpty) {
//       content = ListView.builder(
//         itemCount: event.length,
//         itemBuilder: (ctx, index) => Explore_list(event: event[index],onselectevent: (event){
//           selectEvent(context, event);
//         },
//         //  onToggleFavorite: onToggleFavorite,
//         )
//       );
//     }

//     if(title==null){
//       return content;
//     }
//     return Scaffold(
//       backgroundColor: Color(0xfff5f5f5),
//       appBar: AppBar(title:
//                         Center ( 
//                         child: Padding(
//                           padding: const EdgeInsets.only(right:0),
//                           child: Text(
//                           title!,
//                           style:const TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.w800,
//                             color: Color(0xffE93030),
//                           ),
//                                               ),
//                         ),),backgroundColor:Color(0xfff5f5f5),elevation:0,
      

//         automaticallyImplyLeading: false,),
//       body: content
//     );
//   }
// }


import 'package:campusbuzz/event_detail_screen.dart';
import 'package:campusbuzz/explore_page/explore_page.dart';
import 'package:campusbuzz/model/event.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore(
      {super.key,
      this.title,
      required this.event,
      });

  final String? title;
  final List<Event> event;
  // final void Function(Event event) onToggleFavorite;

  void selectEvent(BuildContext context, Event event) {
    //Navigator.of(context).pop(); //not required
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => EventDetailScreen(
          event: event,
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  // final CollectionReference events =
  //     FirebaseFirestore.instance.collection('events');

      


  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh ... nothing here!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffE93030))),

          const SizedBox(height: 16),
          // Text(
          //   'Try selecting a different category!',
          //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //         color: Theme.of(context).colorScheme.onBackground,
          //       ),
          // ),
        ],
      ),
    );

    if (event.isNotEmpty) {
      content = ListView.builder(
            itemCount: event.length,
            itemBuilder: (ctx, index) => Explore_list(
                  event: event[index],
                  onselectevent: (event) {
                    selectEvent(context, event);
                  },
                  // onToggleFavorite: onToggleFavorite,
                ));
     
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar:
          AppBar(
            toolbarHeight: 100,
            title: Center(
              child: Column(
                children: [
                  
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Color(0xffE93030),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(23.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Search anything...',
                        hintStyle: TextStyle(color: Color(0xffC7C7C7)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffc7c7c7),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                ],
              ),
            ),
            backgroundColor: Color(0xfff5f5f5),
            elevation: 0,
            
          ),
        
        body: content
);
}
}