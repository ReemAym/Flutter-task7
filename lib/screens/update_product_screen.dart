import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});

  static String id = 'update screen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, image, description;

  String? price;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  // label: productModel.title,
                  onChange: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChange: (data) {
                    description = data;
                  },
                  hintText: 'Description',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChange: (data) {
                    price = data;
                  },
                  inputType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  hintText: 'Price',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChange: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  title: 'Update',
                  onTap: () async{
                    isLoading = true;
                    setState(() {});
                    try {
                    await  updateProduct(productModel);
                      print('success****************');
                    } catch (e) {
                      print(e);
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async{
  await  UpdateProductService().updateProduct(
      id:productModel.id,
      title: productName == null ? productModel.title : productName!,
      price: price == null ? productModel.price.toString(): price!,
      desc: description == null ? productModel.description : description!,
      image: image == null ? productModel.image : image!,
      category: productModel.category,
    );
  }
}
