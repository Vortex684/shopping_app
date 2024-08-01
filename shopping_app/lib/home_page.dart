import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';

import 'package:shopping_app/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
 int currentPage=0;
 List<Widget> pages=const [ProductList(),CartPage()];

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
     /* we could also do this changing pages
     body: pages[currentPage]   this can the page but when we came back to our first page we see the from the start instead we should from the
     position we last scrolled so to re solve this matter we use IndexedStack widget which are are scroll position
     it requires a index that which page we are currently on 
     and secondly a list of children where we can mention are pages.
     */ 
      body:IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage=value;
          });
        },
        iconSize: 30,
        // as the label is required it takes some space even if it is empty so to make the bottom bar smaller we set the font sizes to zero.
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items:const [
          BottomNavigationBarItem(
            //here it is neccassery to pass a label because it gives an error when we run are app if it is empty we can just leave it empty
            icon: Icon(Icons.home),
            label: '',
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          
          label: '',
           )
        ],
        ),
      );
    

  }
}