import 'package:flutter/material.dart';
import 'package:fruit_shop/config/constants/constant.dart';
import 'package:fruit_shop/config/data/data.dart';
import 'package:fruit_shop/config/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  static String name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: paddingTop + 20),
              Row(
                children: [
                  CircleAvatar(
                    child: Image.asset(
                      'assets/user.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome to my page"),
                      Text("hello the world"),
                    ],
                  ),
                  const Spacer(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.card_travel,
                        size: 20,
                      ),
                      Positioned(
                        top: 0,
                        right: -2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15)
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Et eiusmod aliqua officia irure quis incididunt.",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(width: 45)
                ],
              ),
              const SizedBox(height: 20),
              const _SearchSection(),
              const SizedBox(height: 20),
              const _CategorySection(),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: data[0].products?.length,
                  itemBuilder: (context, index) {
                    final product = data[0].products![index];
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: red,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  color: product.color,
                                  child: Image.asset(product.image),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(product.name),
                                          const SizedBox(height: 10),
                                          Text(product.price),
                                          const SizedBox(height: 10),
                                          const Text("See more"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: -10,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(5),
                              backgroundColor:
                                  kPrimaryColor, // <-- Button color
                              foregroundColor: white, // <-- Splash color
                              elevation: 0,
                              side: BorderSide.none,
                              shadowColor: Colors.transparent,
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategorySection extends StatefulWidget {
  const _CategorySection();

  @override
  State<_CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<_CategorySection> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...List.generate(data.length, (index) {
          final category = data[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Text(
              category.name,
              style: currentIndex == index
                  ? const TextStyle(color: Colors.red, fontSize: 18)
                  : const TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        })
      ],
    );
  }
}

class _SearchSection extends StatelessWidget {
  const _SearchSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(1, 5),
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 2,
                )
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 35,
                  color: kPrimaryColor,
                ),
                filled: true,
                fillColor: white,
                hintText: "Search Pineaple",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        // Container(
        //   height: 55,
        //   width: 55,
        //   decoration: const BoxDecoration(
        //     color: kPrimaryColor,
        //     shape: BoxShape.circle,
        //   ),
        //   child: const Icon(
        //     Icons.filter_alt_sharp,
        //     size: 35,
        //     color: white,
        //   ),
        // )
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
            backgroundColor: kPrimaryColor, // <-- Button color
            foregroundColor: white, // <-- Splash color
            elevation: 0,
            side: BorderSide.none,
            shadowColor: Colors.transparent,
          ),
          child: const Icon(
            Icons.filter_alt_sharp,
            color: white,
          ),
        )
      ],
    );
  }
}
