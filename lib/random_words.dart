import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('WordPair - Generator')),
        body: _buildList());
  }
}