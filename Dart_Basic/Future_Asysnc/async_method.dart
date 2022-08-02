Future<String> createOrderMessage() async {
  print('synchronous');
  var order = await fetchUserOrder();
  return 'Your order is $order';
}

Future<String> fetchUserOrder() {
  return Future.delayed(Duration(seconds: 2), () => 'Large Latte');
}

void main() async {
  print('Fetching user order...');
  print(await createOrderMessage());
}
