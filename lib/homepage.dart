import 'package:flutter/material.dart';
import 'data.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(
    const Homepage(),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  final filteredProducts1 =
      products.where((product) => product.category == 1).toList();
  final filteredProducts2 =
      products.where((product) => product.category == 2).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEC9E9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.71,
                ),
                items: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Stack(children: [
                      Image.asset(
                        'assets/Banners/banner1.png',
                        height: 200,
                      )
                    ]),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Stack(children: [
                      Image.asset(
                        'assets/Banners/banner2.png',
                        height: 200,
                      )
                    ]),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Stack(children: [
                      Image.asset(
                        'assets/Banners/banner3.png',
                        height: 200,
                      )
                    ]),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ////----------------------------------------------------------------
              /// seperator after Slider
              const Text(
                'ادکلن ها',
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 220,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredProducts2.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts2[index];
                    return Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              width: 150,
                              height: 100,
                              product.imageUrl,
                            ),
                          ),
                          Text(product.name,
                              style: const TextStyle(
                                fontFamily: 'Shabnam',
                                fontSize: 18,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${product.price.toInt()} تومان ',
                            style: const TextStyle(
                              fontFamily: 'Shabnam',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 700,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            product.name,
                                            style: const TextStyle(
                                              fontSize: 25,
                                              fontFamily: 'Shabnam',
                                            ),
                                          ),
                                          Image.asset(
                                            width: 300,
                                            height: 150,
                                            product.imageUrl,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              product.description,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Shabnam',
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              '${product.price.toInt()} تومان ',
                                              style: const TextStyle(
                                                fontFamily: 'Shabnam',
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 30, 12, 5),
                                            child: ElevatedButton.icon(
                                              style: const ButtonStyle(
                                                minimumSize:
                                                    WidgetStatePropertyAll(
                                                        Size(300, 60)),
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Colors.green),
                                              ),
                                              onPressed: () {},
                                              label: const Text(
                                                'خرید',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Shabnam',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              icon: const Icon(
                                                  color: Colors.white,
                                                  Icons.shopping_basket),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            label: const Text(
                              'مشاهده ',
                              style: TextStyle(
                                fontFamily: 'Shabnam',
                                fontSize: 16,
                              ),
                            ),
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ////----------------------------------------------------------------
              /// seperator after Perfumes
              const Text(
                'کرم ها',
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 220,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredProducts1.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts1[index];
                    return Card(
                      color: Colors.white,
                      elevation: 5,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              width: 150,
                              height: 100,
                              product.imageUrl,
                            ),
                          ),
                          Text(product.name,
                              style: const TextStyle(
                                fontFamily: 'Shabnam',
                                fontSize: 18,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${product.price.toInt()} تومان ',
                            style: const TextStyle(
                              fontFamily: 'Shabnam',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 700,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            product.name,
                                            style: const TextStyle(
                                              fontSize: 25,
                                              fontFamily: 'Shabnam',
                                            ),
                                          ),
                                          Image.asset(
                                            width: 300,
                                            height: 150,
                                            product.imageUrl,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              product.description,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Shabnam',
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              '${product.price.toInt()} تومان ',
                                              style: const TextStyle(
                                                fontFamily: 'Shabnam',
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 30, 12, 5),
                                            child: ElevatedButton.icon(
                                              style: const ButtonStyle(
                                                minimumSize:
                                                    WidgetStatePropertyAll(
                                                        Size(300, 60)),
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Colors.green),
                                              ),
                                              onPressed: () {},
                                              label: const Text(
                                                'خرید',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Shabnam',
                                                  color: Colors.white,
                                                ),
                                              ),
                                              icon: const Icon(
                                                  color: Colors.white,
                                                  Icons.shopping_basket),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            label: const Text(
                              'مشاهده ',
                              style: TextStyle(
                                fontFamily: 'Shabnam',
                                fontSize: 16,
                              ),
                            ),
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
