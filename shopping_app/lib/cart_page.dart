import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return  Scaffold(
      appBar: AppBar(
       title: const Center(
         child: Text('CART',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30
            ),
            ),
       ) ,
      ),
      
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder:(context,index){
          final cartItem=cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 50,
            ),
            title: Text(cartItem['title'] as String,style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w300)),
            subtitle: Text('Size: ${cartItem['sizes']}'),
            trailing: IconButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                    title: Text('Delete Item',
                    style: Theme.of(context).textTheme.titleMedium
                    ),
                    content:const Text('Are you sure you want to delete the item'),
                    actions: [
                      TextButton(
                        onPressed: (){
                           Navigator.of(context).pop();
                        },
                         child:const Text('No',style: TextStyle(color: Colors.blue),)
                         ),
                         TextButton(
                        onPressed: (){
                           Provider.of<CartProvider>(context,listen: false).remProduct(cartItem);
                           Navigator.of(context).pop();
                        },
                         child:const Text('Yes',style: TextStyle(color: Colors.red),)
                         ),
                    ],
                  );
                  },
                  
                );
              }
            , icon:const Icon(Icons.delete_rounded),color:Colors.redAccent ,),
          );
        }
        )
    
    );
  }
}