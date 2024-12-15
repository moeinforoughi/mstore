import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(
    const Orderspage(),
  );
}

class Orderspage extends StatefulWidget {
  const Orderspage({super.key});

  @override
  State<Orderspage> createState() => _Orderspage();
}

final doneorders = orders.where((order) => order.status == 'done').toList();
final pendingorder =
    orders.where((order) => order.status == 'pending').toList();
final cancelledorder =
    orders.where((order) => order.status == 'cancelled').toList();

class _Orderspage extends State<Orderspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEC9E9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                width: double.maxFinite,
                child: const Text(
                  'سفارشات در حال ارسال',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Shabnam',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: pendingorder.length,
                  itemBuilder: (context, index) {
                    final order = pendingorder[index];
                    final product = Product.getProductById(order.productId);
                    order.calculatefinalprice();
                    return Card(
                      margin: const EdgeInsets.all(7),
                      color: Colors.white,
                      elevation: 5,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                width: 150,
                                height: 100,
                                product.imageUrl,
                              ),
                            ),
                            Column(children: [
                              Text('کد سفارش ${order.id}',
                                  style: const TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('محصول ${product.name}',
                                  style: const TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('تعداد ${order.quantity}',
                                  style: const TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                ' در حال ارسال ...',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ]),
                            const SizedBox(
                              width: 70,
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
                                              'جزئیات سفارش ${order.id}',
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Shabnam',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                'محصولات : ${product.name}',
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
                                                'تعداد محصول : ${order.quantity}',
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
                                                'قیمت شاخص : ${product.price} تومان',
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
                                                'درصد تخفیف این محصول : ${product.discountpercent}',
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
                                                'قیمت پایانی : ${order.finalPrice.toInt()} تومان',
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
                                                'سود شما از این خرید : ${(order.quantity * product.price) - order.finalPrice} تومان',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Shabnam',
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                '... در حال ارسال',
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Shabnam',
                                                  color: Colors.yellow,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              label: const Text(
                                'جزئیات',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontSize: 16,
                                ),
                              ),
                              icon: const Icon(Icons.details),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                width: double.maxFinite,
                child: const Text(
                  'سفارشات انجام شده',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Shabnam',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: pendingorder.length,
                  itemBuilder: (context, index) {
                    final order = doneorders[index];
                    final product = Product.getProductById(order.productId);
                    order.calculatefinalprice();
                    return Card(
                      margin: const EdgeInsets.all(7),
                      color: Colors.white,
                      elevation: 5,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                width: 150,
                                height: 100,
                                product.imageUrl,
                              ),
                            ),
                            Column(children: [
                              Text('کد سفارش ${order.id}',
                                  style: const TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('محصول ${product.name}',
                                  style: const TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('تعداد ${order.quantity}',
                                  style: const TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                ' تحویل داده شده',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ]),
                            const SizedBox(
                              width: 70,
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
                                              'جزئیات سفارش ${order.id}',
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Shabnam',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                'محصولات : ${product.name}',
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
                                                'تعداد محصول : ${order.quantity}',
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
                                                'قیمت شاخص : ${product.price} تومان',
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
                                                'درصد تخفیف این محصول : ${product.discountpercent}',
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
                                                'قیمت پایانی : ${order.finalPrice.toInt()} تومان',
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
                                                'سود شما از این خرید : ${(order.quantity * product.price) - order.finalPrice} تومان',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Shabnam',
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                'تحویل داده شده',
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Shabnam',
                                                  color: Colors.green,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              label: const Text(
                                'جزئیات',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontSize: 16,
                                ),
                              ),
                              icon: const Icon(Icons.details),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                width: double.maxFinite,
                child: const Text(
                  'سفارشات لغو شده',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Shabnam',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 300,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cancelledorder.length,
                  itemBuilder: (context, index) {
                    final order = doneorders[index];
                    final product = Product.getProductById(order.productId);
                    order.calculatefinalprice();
                    return Card(
                      margin: const EdgeInsets.all(7),
                      color: Colors.white,
                      elevation: 5,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                width: 150,
                                height: 100,
                                product.imageUrl,
                              ),
                            ),
                            Column(children: [
                              Text('کد سفارش ${order.id}',
                                  style: const TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('محصول ${product.name}',
                                  style: const TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('تعداد ${order.quantity}',
                                  style: const TextStyle(
                                    fontFamily: 'Shabnam',
                                    fontSize: 12,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'لغو شده',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ]),
                            const SizedBox(
                              width: 70,
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
                                              'جزئیات سفارش ${order.id}',
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Shabnam',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                'محصولات : ${product.name}',
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
                                                'تعداد محصول : ${order.quantity}',
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
                                                'قیمت شاخص : ${product.price} تومان',
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
                                                'درصد تخفیف این محصول : ${product.discountpercent}',
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
                                                'قیمت پایانی : ${order.finalPrice.toInt()} تومان',
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
                                                'سود شما از این خرید : ${(order.quantity * product.price) - order.finalPrice} تومان',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Shabnam',
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                'لغو شده',
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Shabnam',
                                                  color: Colors.red,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              label: const Text(
                                'جزئیات',
                                style: TextStyle(
                                  fontFamily: 'Shabnam',
                                  fontSize: 16,
                                ),
                              ),
                              icon: const Icon(Icons.details),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
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
