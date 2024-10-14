import 'package:flutter/material.dart';
import 'package:store_app/Models/product_model.dart';

import '../Screens/UpdateProductScreen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.productModel
  });

  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 40,
                    offset: const Offset(10, 10),
                  )
                ]
            ),
            child: Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productModel.title.substring(0,11),style: const TextStyle(color: Colors.grey),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(productModel.price.toString(),style: const TextStyle(fontSize: 18),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.grey,)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 70,
            bottom: 90,
            child: Image.network(productModel.image,height: 100,width: 100,),
          ),
        ],
      ),
    );
  }
}
