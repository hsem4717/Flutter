import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_detail.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_header.dart';
import 'package:flutter_shoppingcart/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: const ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int _selectedId = 0;

  final List<String> _titles = [
    "주르르",
    "릴파",
    "징버거",
    "아이네",
  ];

  final List<String> _descriptions = [
    "주돈사, 얼마전 생일 이었던 분. 공주라고도 불림",
    "릴트리버, 노래 잘부름, 7월 12일~13일 전국적으로 콘서트 진행 예정",
    "ㄱㅇㅇ, 태산부가. 귀엽다",
    "주인장 최애, 158, 구구ㅜ구ㄱㄱ구ㅜ. 노래 잘부르심",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Column(
        children: [
          ShoppingCartHeader(
            onIconSelected: (index) {
              setState(() {
                _selectedId = index;
              });
            },
          ),
          Expanded(
            child: ShoppingCartDetail(
              title: _titles[_selectedId],
              description: _descriptions[_selectedId],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildShoppingCartAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
      ],
      elevation: 0.0,
    );
  }
}
