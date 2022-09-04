class MyHomePage extends StatelessWidget {

  final _items = List.generate(50, (i) => ListTile(title: Text('No. $i')));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverAppBar/SliverFillRemaining"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,   // 축소시 상단에 AppBar가 고정되는지 설정
            expandedHeight: 180.0,  // 헤더의 최대 높이
            flexibleSpace: FlexibleSpaceBar(  // 늘어나는 영역의 UI 정의
              title: Text("Sliver"),
              background: Image.asset('images/sample.jpg',
                  fit: BoxFit.cover
              ),
            ),
            actions: [
              IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.arrow_downward),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(_items),
          ),
        ],
      ),
    );
  }
}