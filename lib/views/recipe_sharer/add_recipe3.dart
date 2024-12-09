import 'package:flutter/material.dart';
import 'package:newafest/controller/recipe_controller.dart';
import 'package:newafest/models/user_model.dart';
import 'package:newafest/utility/display_message.dart';
import 'package:newafest/utility/loader.dart';
import 'package:newafest/widgets/custom_header.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_add_recipe/custom_add_button.dart';
import '../../widgets/custom_button.dart';

class AddRecipe3 extends StatefulWidget {
  const AddRecipe3({super.key});

  @override
  State<AddRecipe3> createState() => _AddRecipe3State();
}

class _AddRecipe3State extends State<AddRecipe3> {
  bool setIsLoading=false;
  final List<String> _stepsList = [];
  final TextEditingController _stepController = TextEditingController();

  final OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      style: BorderStyle.solid,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  Widget _stepTextField() {
    return TextField(
      controller: _stepController,
      minLines: 1,
      maxLines: null,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: "Add a Step",
        filled: true,
        fillColor: Colors.white,
        focusedBorder: border,
        enabledBorder: border,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  void _addStep() {
    final step = _stepController.text.trim();
    if (step.isNotEmpty) {
      setState(() {
        _stepsList.add(step);
        _stepController.clear();
      });
    }
  }
  void _submit() async {


    setState(() {
      setIsLoading = true;
    });

    final user = Provider.of<UserModel?>(context, listen: false);
    final Map<String, dynamic>? data =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (data != null) {
      final combinedData = {
        ...data,
        'steps': _stepsList,
        'sharerId': user?.uid,
      };
      try {
        await RecipeController().addRecipeToFirebase(context, combinedData);
        setState(() {
          setIsLoading = false;
        });
        Navigator.pushNamed(context, "/chef_profile");

        DisplayMessage.displayMessage(
          context,
          "Recipe added successfully!",
          AlertType.success,
        );
      } catch (e) {
        setState(() {
          setIsLoading = false;
        });
        print("Error: $e");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return setIsLoading? const NewaFestLoader(): Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(title: 'Add Steps', route: '/add_recipe2'),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),

                  child: Column(
                    children: [
                      const Text(
                        "Steps",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: "Poppins",
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _stepTextField(),
                      const SizedBox(height: 15),
                      CustomOutlinedAddButton(
                        icon: const Icon(Icons.add),
                        text: "Add Step",
                        onPressed: _addStep,
                      ),
                      const SizedBox(height: 15),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _stepsList.length,
                        itemBuilder: (context, index) {
                          final step = _stepsList[index];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1), // Add a border
                              borderRadius: BorderRadius.circular(5), // Optional rounded corners
                              color: Colors.white, // Background color for contrast
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 5), // Space between tiles
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey.shade300,
                                child: Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              title: Text(
                                step,
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _stepsList.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: CustomButton(
                  txt1: "Save",
                  bg: const Color(0xff701714),
                  textColor: Colors.white,
                  onPressed: _submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
