import 'package:flutter/material.dart';
import 'package:shopping_app/dummy.dart';
import "package:shopping_app/pagedata.dart";
import 'package:shopping_app/product_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
   final border=const OutlineInputBorder(
    borderRadius: BorderRadius.horizontal(left: Radius.circular(35)),
    borderSide:BorderSide(
    color: Colors.grey,
    ) ,
    );

     List<String> filters=['ALL','ADIDAS','NIKE','BATA'];
    late String selectedFilter;
     @override
    void initState(){
      super.initState();
      selectedFilter=filters[0];
    }
     

  @override
  Widget build(BuildContext context) {
    //media query helps u with different screen sizes and other screen features and how u want your widgets to appear on different emulators.
    //  final  size=MediaQuery.sizeOf(context);
    //the code using media query is comented at the end .
    return Scaffold(
      body: SafeArea(
        child: 
          Column(
          children:[ Row(
          children: [
           const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text('Shoes\nCollection',
                        style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        ) ,
                        ),
            ),
            /*as the textfeild has the property to completely take all the screen space in order to restrict it we use a widget 'Expanded' which
             makes the textfeild to take the space the space that is present instead of taking all space*/
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon:const Icon(Icons.search),
                border:border,
                enabledBorder: border,
                focusedBorder: border
              ),
              ),
          ),
          ],
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder:(context,index){
            final filter=filters[index];
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: GestureDetector(
                
                onTap: () {
                  setState(() {
                    selectedFilter=filter;
                  });
                },
                 child: Chip(
                  backgroundColor:  selectedFilter==filter?Theme.of(context).colorScheme.primary : const Color.fromARGB(66, 223, 220, 220),
                  label:Text(filter),
                  labelStyle:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                    ),
                    padding:const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15
                    ),
                  side:const BorderSide(
                    color: Color.fromARGB(84, 255, 255, 255)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor:const Color.fromARGB(255, 65, 65, 65),
                  ),
               ),
             );
            }
            ),
        ),
        
        /*we can either make are UI responsive using media query or we can use another widget called layout builder. It is better to use layout
        buildre because it follows the restriction of parent widgets where as media query even if it parent provides some resrriction media query
        does not impose them */
        Expanded(
          child:LayoutBuilder(
            builder: (context,constraints) {
              if (constraints.maxWidth>1080){
              return GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5, 
              ),
              itemCount: products.length, 
              itemBuilder: (context,index){
               final product=products[index];
               return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return ProductDetail(product: product);
                    }
                    ),
                    );
                },
                child: Pagedata(
                  title: product['title'] as String, 
                  price: product['price'] as double,
                  image: product['imageUrl'] as String,
                  backgroundColor: index.isEven?
                   const Color.fromARGB(255, 182, 214, 231):const Color.fromARGB(84, 255, 255, 255),
                  ),
              );
             
            }
            );
            }
            else{
            return ListView.builder(
            itemCount: products.length,
            itemBuilder:(context,index){
              final product=products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return ProductDetail(product: product);
                    }
                    ),
                    );
                },
                child: Pagedata(
                  title: product['title'] as String, 
                  price: product['price'] as double,
                  image: product['imageUrl'] as String,
                  backgroundColor: index.isEven?
                   const Color.fromARGB(255, 182, 214, 231):const Color.fromARGB(84, 255, 255, 255),
                  ),
              );
                }
              );
            }
            }
            )
           ),
          ], 
      ),
    ),
    );
  }
}
        // Expanded(
        //   child: size.width > 650? 
        //    GridView.builder(
        //       gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       childAspectRatio: 2, 
        //       ),
        //       itemCount: products.length, 
        //       itemBuilder: (context,index){
        //        final product=products[index];
        //        return GestureDetector(
        //         onTap: () {
        //           Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context){
        //               return ProductDetail(product: product);
        //             }
        //             ),
        //             );
        //         },
        //         child: Pagedata(
        //           title: product['title'] as String, 
        //           price: product['price'] as double,
        //           image: product['imageUrl'] as String,
        //           backgroundColor: index.isEven?
        //            const Color.fromARGB(255, 182, 214, 231):const Color.fromARGB(84, 255, 255, 255),
        //           ),
        //       );
             
        //     }
        //     )
        //     : ListView.builder(
        //     itemCount: products.length,
        //     itemBuilder:(context,index){
        //       final product=products[index];
        //       return GestureDetector(
        //         onTap: () {
        //           Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context){
        //               return ProductDetail(product: product);
        //             }
        //             ),
        //             );
        //         },
        //         child: Pagedata(
        //           title: product['title'] as String, 
        //           price: product['price'] as double,
        //           image: product['imageUrl'] as String,
        //           backgroundColor: index.isEven?
        //            const Color.fromARGB(255, 182, 214, 231):const Color.fromARGB(84, 255, 255, 255),
        //           ),
        //       );
        //         }
        //       ),
        //     ),
