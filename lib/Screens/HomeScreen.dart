import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/Services/get_all_product_service.dart';
import 'package:store_app/Widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('New Trend',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.cartShopping)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 70,bottom: 15),
        child: FutureBuilder<List<ProductModel>>(
            future: GetAllProductService().getAllProducts(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                List<ProductModel> productsList = snapshot.data!;
                return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 90,
                        crossAxisSpacing: 10
                    ),
                    itemCount: productsList.length,
                    itemBuilder: (context, index){
                      return CustomCard(productModel: productsList[index],);
                    }
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }
        ),
      ),
    );
  }
}
