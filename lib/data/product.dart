class Product {
  final String category;
  final String name;
  final String link;

  Product(this.category, this.name, this.link);
}

Map<String, List<Product>> productsByScalpCondition = {
  'Sensitive Scalp': [
    Product('Shampoo', 'Sensitive Scalp Best', 'https://brand.naver.com/vadev/products/7216311867'),
    Product('Shampoo', 'Sensitive Scalp 2nd', 'https://smartstore.naver.com/veganus/products/9595858518'),
    Product('Shampoo', 'Sensitive Scalp 3rd', 'https://rebecoco.com/25/?idx=117'),
    Product('Rinse', 'Sensitive Scalp Best', 'https://www.glowpick.com/products/145069'),
    Product('Rinse', 'Sensitive Scalp 2nd', 'https://www.glowpick.com/products/108680'),
    Product('Rinse', 'Sensitive Scalp 3rd', 'https://www.glowpick.com/products/27448'),
    Product('Treatment', 'Sensitive Scalp Best', 'https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000157801'),
    Product('Treatment', 'Sensitive Scalp 2nd', 'https://www.coupang.com/vp/products/6470425179'),
    Product('Treatment', 'Sensitive Scalp 3rd', 'https://www.innisfree.com/kr/ko/ProductView.do?prdSeq=35225'),
  ],
  'Combination Scalp': [
    Product('Shampoo', 'Combination Scalp Best', 'https://www.ulos.co.kr/goods/goods_view.php?goodsNo=1000000028'),
    Product('Shampoo', 'Combination Scalp 2nd', 'https://www.drforhair.co.kr/goods/goods_view.php?goodsNo=1000000089'),
    Product('Shampoo', 'Combination Scalp 3rd', 'https://titad.kr/product/detail.html?product_no=16'),
    Product('Rinse', 'Combination Scalp Best', 'https://www.glowpick.com/products/145069'),
    Product('Rinse', 'Combination Scalp 2nd', 'https://www.glowpick.com/products/108680'),
    Product('Rinse', 'Combination Scalp 3rd', 'https://www.glowpick.com/products/27448'),
    Product('Treatment', 'Combination Scalp Best', 'https://www.oliveyoung.co.kr/store/goods/getGoodsDetail.do?goodsNo=A000000157801'),
    Product('Treatment', 'Combination Scalp 2nd', 'https://www.coupang.com/vp/products/6470425179'),
    Product('Treatment', 'Combination Scalp 3rd', 'https://www.innisfree.com/kr/ko/ProductView.do?prdSeq=35225'),
  ],
  'Dandruff Scalp': [
    Product('Shampoo', 'Dandruff Scalp Best', 'https://titad.kr/product/detail.html?product_no=16&cate_no=49&display_group=1'),
    Product('Shampoo', 'Dandruff Scalp 2nd', 'https://brand.naver.com/vadev/products/5477157512'),
    Product('Shampoo', 'Dandruff Scalp 3rd', 'https://smartstore.naver.com/amosshop/products/4697804006'),
    Product('Rinse', 'Dandruff Scalp Best', 'https://smartstore.naver.com/vaadiherbals/products/676492529'),
    Product('Rinse', 'Dandruff Scalp 2nd', 'https://smartstore.naver.com/okyeedream/products/8987609640'),
    Product('Rinse', 'Dandruff Scalp 3rd', 'https://search.shopping.naver.com/catalog/11392087639'),
    Product('Treatment', 'Dandruff Scalp Best', 'http://itempage3.auction.co.kr/DetailView.aspx?ItemNo=D866549964'),
    Product('Treatment', 'Dandruff Scalp 2nd', 'https://banggiwon.com/product/107'),
    Product('Treatment', 'Dandruff Scalp 3rd', 'https://doctorbio.kr/product/25'),
  ],
  'Hair Loss': [
    Product('Shampoo', 'Hair Loss Best', 'https://laboh.co.kr/product/detail.html?product_no=43'),
    Product('Shampoo', 'Hair Loss 2nd', 'https://smartstore.naver.com/beautypam/products/9668912403'),
    Product('Shampoo', 'Hair Loss 3rd', 'https://brand.naver.com/drforhair/products/574064670'),
    Product('Rinse', 'Hair Loss Best', 'https://vivelab.kr/product/detail.html?product_no=35'),
    Product('Rinse', 'Hair Loss 2nd', 'https://smartstore.naver.com/perfectpickss/products/9817150185'),
    Product('Rinse', 'Hair Loss 3rd', 'https://terapic.co.kr/product/19'),
    Product('Treatment', 'Hair Loss Best', 'https://brand.naver.com/drbanggiwon/products/5002416551'),
    Product('Treatment', 'Hair Loss 2nd', 'https://brand.naver.com/drforhair/products/4027052156'),
    Product('Treatment', 'Hair Loss 3rd', 'https://smartstore.naver.com/labcle/products/6938290178'),
  ],
  'Hair Loss with Sensitive Scalp': [
    Product('Shampoo', 'Hair Loss & Sensitive Best', 'https://brand.naver.com/vadev/products/7216311867'),
    Product('Shampoo', 'Hair Loss & Sensitive 2nd', 'https://smartstore.naver.com/veganus/products/9595858518'),
    Product('Shampoo', 'Hair Loss & Sensitive 3rd', 'https://rebecoco.com/25/?idx=117'),
    Product('Rinse', 'Hair Loss & Sensitive Best', 'https://brand.naver.com/pghairstore/products/6684159959'),
    Product('Rinse', 'Hair Loss & Sensitive 2nd', 'https://therapytion.com/shop/shopdetail.html?branduid=1095419'),
    Product('Rinse', 'Hair Loss & Sensitive 3rd', 'https://dslaboratories.asia/product/27'),
    Product('Treatment', 'Hair Loss & Sensitive Best', 'https://brand.naver.com/vadev/products/6562981209'),
    Product('Treatment', 'Hair Loss & Sensitive 2nd', 'https://macklin.co.kr/treatment/?idx=196'),
    Product('Treatment', 'Hair Loss & Sensitive 3rd', 'https://smartstore.naver.com/veganus/products/9595892304'),
  ],
  'Oily Scalp': [
    Product('Shampoo', 'Oily Scalp Best', 'https://www.avedakorea.com/product/5311/62084'),
    Product('Shampoo', 'Oily Scalp 2nd', 'https://brand.naver.com/pghairstore/products/5095919532'),
    Product('Shampoo', 'Oily Scalp 3rd', 'https://shopping.naver.com/window-products/foreign/5797777038'),
    Product('Rinse', 'Oily Scalp Best', 'https://search.shopping.naver.com/catalog/12211506447'),
    Product('Rinse', 'Oily Scalp 2nd', 'https://search.shopping.naver.com/catalog/12099507300'),
    Product('Rinse', 'Oily Scalp 3rd', 'https://smartstore.naver.com/satisfaction026/products/9688572405'),
    Product('Treatment', 'Oily Scalp Best', 'https://nardcare.co.kr/product/267'),
    Product('Treatment', 'Oily Scalp 2nd', 'https://search.shopping.naver.com/catalog/23561436491'),
    Product('Treatment', 'Oily Scalp 3rd', 'https://smartstore.naver.com/sesangdamgi/products/9788798489'),
  ],
  'Hair Loss with Dandruff': [
    Product('Shampoo', 'Hair Loss & Dandruff Best', 'https://titad.kr/product/detail.html?product_no=16'),
    Product('Shampoo', 'Hair Loss & Dandruff 2nd', 'https://brand.naver.com/vadev/products/5477157512'),
    Product('Shampoo', 'Hair Loss & Dandruff 3rd', 'https://smartstore.naver.com/amosshop/products/4697804006'),
    Product('Rinse', 'Hair Loss & Dandruff Best', 'https://smartstore.naver.com/vaadiherbals/products/676492529'),
    Product('Rinse', 'Hair Loss & Dandruff 2nd', 'https://smartstore.naver.com/okyeedream/products/8987609640'),
    Product('Rinse', 'Hair Loss & Dandruff 3rd', 'https://search.shopping.naver.com/catalog/11392087639'),
    Product('Treatment', 'Hair Loss & Dandruff Best', 'http://itempage3.auction.co.kr/DetailView.aspx?ItemNo=D866549964'),
    Product('Treatment', 'Hair Loss & Dandruff 2nd', 'https://banggiwon.com/product/107'),
    Product('Treatment', 'Hair Loss & Dandruff 3rd', 'https://doctorbio.kr/product/25'),
  ],
  'Hair Loss with Oily Scalp': [
    Product('Shampoo', 'Hair Loss & Oily Best', 'https://www.lotteon.com/p/product/LO1468218586'),
    Product('Shampoo', 'Hair Loss & Oily 2nd', 'https://www.coupang.com/vp/products/6568370029'),
    Product('Shampoo', 'Hair Loss & Oily 3rd', 'https://www.lotteon.com/p/product/LO2154203522'),
    // Note: Rinse and Treatment not recommended for this condition
  ],
};