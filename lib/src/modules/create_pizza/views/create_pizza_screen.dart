import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_repository/pizza_repository.dart';

import '../../../components/my_text_field.dart';
import '../components/macro.dart';

class CreatePizzaScreen extends StatefulWidget {
  const CreatePizzaScreen({super.key});

  @override
  State<CreatePizzaScreen> createState() => _CreatePizzaScreenState();
}

class _CreatePizzaScreenState extends State<CreatePizzaScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final caloriesController = TextEditingController();
  final proteinController = TextEditingController();
  final fatController = TextEditingController();
  final carbsController = TextEditingController();
  String? _errorMsg;
  late Pizza pizza;

  @override
  void initState() {
    pizza = Pizza.empty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create a New Pizza !',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 20),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  // Handle tap event
                },
                child: Ink(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.photo,
                        size: 100,
                        color: Colors.grey.shade200,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Add a Picture here...",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 400,
                      child: MyTextField(
                        controller: nameController,
                        hintText: 'Name',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        errorMsg: _errorMsg,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: MyTextField(
                        controller: descriptionController,
                        hintText: 'Description',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        errorMsg: _errorMsg,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                              controller: priceController,
                              hintText: 'Price',
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: const Icon(CupertinoIcons.mail_solid),
                              errorMsg: _errorMsg,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please fill in this field';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: MyTextField(
                              controller: discountController,
                              hintText: 'Discount',
                              suffixIcon: const Icon(
                                CupertinoIcons.percent,
                                color: Colors.grey,
                              ),
                              obscureText: false,
                              keyboardType: TextInputType.emailAddress,
                              errorMsg: _errorMsg,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please fill in this field';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text('Is Vege:'),
                        const SizedBox(width: 10),
                        Checkbox(
                          value: pizza.isVeg,
                          onChanged: (value) {
                            setState(() {
                              pizza.isVeg = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Text('Is Spicy:'),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  pizza.spicy = 1;
                                });
                              },

                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    pizza.spicy = 2;
                                  });
                                },
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      pizza.spicy = 3;
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: pizza.spicy == 1
                                          ? Border.all(width: 2)
                                          : null,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: pizza.spicy == 2
                                    ? Border.all(width: 2)
                                    : null,
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: pizza.spicy == 3
                                    ? Border.all(width: 2)
                                    : null,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('Macros:'),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          MyMacroWidget(
                            title: "Calories",
                            value: 12,
                            icon: FontAwesomeIcons.fire,
                            controller: caloriesController,
                          ),
                          const SizedBox(width: 10),
                          MyMacroWidget(
                            title: "Protein",
                            value: 12,
                            icon: FontAwesomeIcons.dumbbell,
                            controller: proteinController,
                          ),
                          const SizedBox(width: 10),
                          MyMacroWidget(
                            title: "Fat",
                            value: 12,
                            icon: FontAwesomeIcons.oilWell,
                            controller: fatController,
                          ),
                          const SizedBox(width: 10),
                          MyMacroWidget(
                            title: "Carbs",
                            value: 12,
                            icon: FontAwesomeIcons.breadSlice,
                            controller: carbsController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
