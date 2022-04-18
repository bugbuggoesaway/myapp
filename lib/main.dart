import 'package:flutter/material.dart';
import 'package:myapp/douban_movie.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '豆瓣电影 Top 250'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Movie> _movies = <Movie>[
    Movie(
        name: "The Shawshank Redemption",
        chineseName: "肖申克的救赎",
        coverUrl:
            "https://img2.doubanio.com/view/photo/s_ratio_poster/public/p480747492.jpg",
        summary: "希望让人自由。",
        rating: 97),
    Movie(
        name: "Farewell My Concubine",
        chineseName: "霸王别姬",
        coverUrl:
            "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2561716440.jpg",
        summary: "风华绝代。",
        rating: 96),
    Movie(
        name: "Forrest Gump",
        chineseName: "阿甘正传",
        coverUrl:
            "https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2372307693.jpg",
        summary: "一部美国近现代史。",
        rating: 95),
    Movie(
        name: "Titanic",
        chineseName: "泰坦尼克号",
        coverUrl:
            "https://img9.doubanio.com/view/photo/s_ratio_poster/public/p457760035.jpg",
        summary: "失去的才是永恒的。",
        rating: 94),
    Movie(
        name: "Léon",
        chineseName: "这个杀手不太冷",
        coverUrl:
            "https://img2.doubanio.com/view/photo/s_ratio_poster/public/p511118051.jpg",
        summary: "怪蜀黍和小萝莉不得不说的故事。",
        rating: 50),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _movies.length * 2,
        itemBuilder: _itemBuilder,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index.isOdd) {
      return const Divider();
    }
    Movie movie = _movies[index ~/ 2];
    return ListTile(
      title: Text(movie.chineseName),
      subtitle: Text(movie.summary),
      leading: Image.network(
        movie.coverUrl,
      ),
      trailing: Wrap(
        spacing: 5.0,
        children: [
          SimpleStarRating(
            size: 15,
            allowHalfRating: true,
            rating: movie.rating / 20,
          ),
          Text('${movie.rating / 10}'),
        ],
      ),
    );
  }
}
