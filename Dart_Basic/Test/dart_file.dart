class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 8.0,
          child: Icon(
            Icons.face,
            color: Colors.grey,
            size: 200,
          ),
        ),
      ),
    );
  }
}
