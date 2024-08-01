import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class ProductDetail extends StatefulWidget {
  final Map<String,Object> product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedSize=0;

  void onTap(){
    if(selectedSize!=0){
    Provider.of<CartProvider>(context, listen: false).addProduct(
     {
      'id': widget.product['id'],
      'title': widget.product['title'],
      'price': widget.product['price'],
      'imageUrl': widget.product['imageUrl'],
      'company': widget.product['company'],
      'sizes': selectedSize,
    }
  );
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Item added seccessfully'))
  );
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select a size!'),
      ),
    );
  }
} 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title:const Text('Details'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Text(widget.product['title'] as String,style: Theme.of(context).textTheme.titleLarge,)),
            const Spacer(),
            Image.asset(widget.product['imageUrl'] as String),
            const Spacer(flex: 2),
            Container(
              padding:const EdgeInsets.all(20),
              height: 250,
              decoration: BoxDecoration(
                color: const Color.fromARGB(66, 223, 220, 220),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Text('\$${widget.product['price']}' ,style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context,index)
                      {
                        final size=(widget.product['sizes'] as List<int>)[index];
                         return Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: GestureDetector(
                            onTap: () { 
                              setState(() {
                                selectedSize=size;
                              });
                            },
                             child: Chip(
                              label:Text(size.toString()),
                              backgroundColor: selectedSize==size? Theme.of(context).colorScheme.primary : null,
                              ),
                           ),
                         );
                      }
                      ),
                  ),
                  ElevatedButton(
                    onPressed: onTap,
                    style:ElevatedButton.styleFrom(
                      fixedSize:const Size(250,50),
                      backgroundColor: Theme.of(context).colorScheme.primary
                    ),
                    child:const Text('Add to Cart',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}