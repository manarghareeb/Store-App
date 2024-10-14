import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Models/product_model.dart';
import 'package:store_app/Widgets/custom_button.dart';
import 'package:store_app/Widgets/custom_text_form_field.dart';

import '../Services/update_product.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

  static String id = "Update Product";

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, imageUrl;

  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 130,),
                CustomTextField(
                  hintText: 'Product Name',
                  onChanged: (data){
                    productName = data;
                  },
                ),
                const SizedBox(height: 20,),
                CustomTextField(
                  hintText: 'Price',
                  onChanged: (data){
                    price = data;
                  },
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 20,),
                CustomTextField(
                  hintText: 'Description',
                  onChanged: (data){
                    description = data;
                  },
                ),
                const SizedBox(height: 20,),
                CustomTextField(
                  hintText: 'Image URL',
                  onChanged: (data){
                    imageUrl = data;
                  },
                ),
                const SizedBox(height: 40,),
                CustomButton(text: 'Update',onTap: (){
                  isLoading = true;
                  setState(() {});
                  try {
                    updateProduct(product);
                    print('success');
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel product) {
    UpdateProduct().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image:  imageUrl == null ? product.image : imageUrl!,
      category: product.category,
    );
  }
}
