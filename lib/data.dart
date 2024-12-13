class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final int quantity;
  final int category;
  final double discountpercent;
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.imageUrl,
      required this.description,
      required this.category,
      this.discountpercent = 0.0});
  static Product getProductById(int id) {
    return products.firstWhere(
      (product) => product.id == id,
    );
  }
}

class Order {
  final int id;
  final int productId;
  final int userId;
  final int quantity;
  double finalPrice;
  final String status;
  Order({
    required this.id,
    required this.productId,
    required this.quantity,
    this.finalPrice = 0.0,
    required this.userId,
    required this.status,
  });
  void calculatefinalprice() {
    final product = Product.getProductById(productId);
    if (product.discountpercent == 0) {
      finalPrice = quantity * product.price;
    } else {
      finalPrice =
          quantity * product.price * (1 - product.discountpercent / 100);
    }
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String imageurl;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageurl,
  });
  static User getUserById(int id) {
    return users.firstWhere(
      (user) => user.id == id,
    );
  }
}

// Sample data
final List<Product> products = [
  Product(
    id: 1,
    name: 'کرم مک کویین',
    description:
        'کرم مرطوب‌کننده‌ای که به طور عمقی پوست را آبرسانی می‌کند و باعث نرمی و شادابی پوست می‌شود این کرم با فرمولاسیون سبک و جذب سریع مناسب برای انواع پوست بوده و بدون ایجاد حس چربی روی پوست استفاده می‌شود',
    price: 105000,
    imageUrl: 'assets/Products/product1.png',
    quantity: 5,
    category: 1,
    discountpercent: 10,
  ),
  Product(
    id: 2,
    name: 'کرم پودر',
    description:
        'شامپویی تقویت‌کننده که با ترکیبات گیاهی و عصاره‌های طبیعی طراحی شده است این محصول به بازسازی موهای آسیب‌دیده کمک کرده و به موها ظاهری درخشان و سالم می‌بخشد',
    price: 50000,
    imageUrl: 'assets/Products/product2.png',
    quantity: 10,
    category: 1,
    discountpercent: 15,
  ),
  Product(
    id: 3,
    name: 'ادکلن ایدورا',
    description:
        'عطری با رایحه گرم و شرقی که حس لوکس و خاصی را به شما می‌بخشد این محصول ماندگاری بالا و جذابیتی بی‌نظیر دارد که مناسب مجالس و مهمانی‌های شبانه است',
    price: 200000,
    imageUrl: 'assets/Products/product3.png',
    quantity: 5,
    category: 2,
  ),
  Product(
    id: 4,
    name: 'کرم ترو پرفکشن',
    description:
        'کرم مرطوب‌کننده با ترکیبات آبرسان قوی که پوست را نرم و لطیف می‌کند این محصول مناسب برای پوست‌های خشک و دهیدراته بوده و حس طراوت را به پوست برمی‌گرداند',
    price: 250000,
    imageUrl: 'assets/Products/product4.png',
    quantity: 6,
    category: 1,
    discountpercent: 3,
  ),
  Product(
    id: 5,
    name: 'ادکلن دبور',
    description:
        'عطری با رایحه شیرین و وانیلی که حسی رمانتیک و دلنشین ایجاد می‌کند این محصول با ترکیبی از نت‌های گلی و میوه‌ای انتخابی مناسب برای قرارهای خاص و روزهای سرد است',
    price: 320000,
    imageUrl: 'assets/Products/product5.png',
    quantity: 7,
    category: 2,
    discountpercent: 18,
  ),
  Product(
    id: 6,
    name: 'کرم لورال',
    description:
        'کرم ضدچروک غنی از کلاژن و ویتامین C که به کاهش خطوط ریز و چین‌وچروک‌های پوست کمک می‌کند این محصول با خاصیت بازسازی‌کننده باعث جوان‌تر شدن ظاهر پوست می‌شود',
    price: 190000,
    imageUrl: 'assets/Products/product6.png',
    quantity: 8,
    category: 1,
    discountpercent: 5,
  ),
  Product(
    id: 7,
    name: 'کرم دکلار',
    description:
        'کرم روشن‌کننده با فرمولاسیون غنی از مواد مغذی و عصاره‌های گیاهی که به کاهش لک‌های تیره کمک کرده و پوست را شفاف و یکدست می‌سازد',
    price: 270000,
    imageUrl: 'assets/Products/product7.png',
    quantity: 9,
    category: 1,
    discountpercent: 21,
  ),
  Product(
    id: 8,
    name: 'کرم لانکوم',
    description:
        'کرم شب با خاصیت ترمیم‌کنندگی که در طول شب پوست را تغذیه و بازسازی می‌کند این محصول حاوی آنتی‌اکسیدان‌های قوی است که به شادابی پوست کمک می‌کند',
    price: 160000,
    imageUrl: 'assets/Products/product8.png',
    quantity: 10,
    category: 1,
  ),
  Product(
    id: 9,
    name: 'کرم کلین',
    description:
        'کرم دور چشم با ترکیبات آبرسان و کافئین که به کاهش تیرگی و پف زیر چشم کمک می‌کند این محصول با بافت سبک مناسب برای استفاده روزانه است',
    price: 95000,
    imageUrl: 'assets/Products/product9.png',
    quantity: 13,
    category: 1,
  ),
  Product(
    id: 10,
    name: 'کرم لایف',
    description:
        'کرم دست با ترکیبات مغذی و آبرسان که از خشکی و ترک‌های پوستی جلوگیری می‌کند این کرم به سرعت جذب شده و نرمی و لطافت را به دستان شما هدیه می‌دهد',
    price: 120000,
    imageUrl: 'assets/Products/product10.png',
    quantity: 5,
    category: 1,
  ),
  Product(
    id: 11,
    name: 'کرم اولای',
    description:
        'کرم ضدحساسیت برای پوست‌های حساس و مستعد قرمزی که آرامش‌بخش پوست است این محصول حاوی مواد تسکین‌دهنده و بدون عطر و مواد تحریک‌کننده است',
    price: 340000,
    imageUrl: 'assets/Products/product11.png',
    quantity: 6,
    category: 1,
  ),
  Product(
    id: 12,
    name: 'ادکلن فلاوربمب',
    description:
        'عطری با رایحه گرم و شرقی که حس لوکس و خاصی را به شما می‌بخشد این محصول ماندگاری بالا و جذابیتی بی‌نظیر دارد که مناسب مجالس و مهمانی‌های شبانه است',
    price: 98000,
    imageUrl: 'assets/Products/product12.png',
    quantity: 7,
    category: 2,
  ),
  Product(
    id: 13,
    name: 'ادکلن فلاور',
    description:
        'عطری با رایحه چوبی و مشک که ترکیبی از انرژی و اعتمادبه‌نفس را القا می‌کند این محصول ماندگاری بالایی دارد و مناسب برای کسانی است که به دنبال امضای عطری خاص هستند',
    price: 170000,
    imageUrl: 'assets/Products/product13.png',
    quantity: 8,
    category: 2,
  ),
];
final List<User> users = [
  User(
      id: 1,
      name: 'معین فروغی',
      email: 'moeinfrq@gmail.com',
      imageurl: 'assets/Users/user1.png'),
];
final List<Order> orders = [
  Order(
    id: 150,
    productId: 5,
    quantity: 2,
    userId: 1,
    status: 'pending',
  ),
  Order(
    id: 152,
    productId: 12,
    quantity: 5,
    userId: 1,
    status: 'done',
  ),
  Order(
    id: 154,
    productId: 9,
    quantity: 1,
    userId: 1,
    status: 'cancelled',
  ),
  Order(
    id: 156,
    productId: 3,
    quantity: 3,
    userId: 1,
    status: 'pending',
  ),
  Order(
    id: 158,
    productId: 6,
    quantity: 2,
    userId: 1,
    status: 'done',
  ),
];
