// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StartUp Name Generator',
        theme: Theme.of(context).copyWith(
            accentIconTheme:
                Theme.of(context).accentIconTheme.copyWith(color: Colors.blue),
            accentColor: Colors.amber,
            primaryColor: Colors.black),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18.0, color: Colors.white);

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : Colors.blue,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return Container(
      color: Colors.black,
      child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd)
              return Divider(
                color: Colors.blueAccent,
              );

            final index = i ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
          }),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        final tiles = _saved.map(
          (WordPair wordPair) {
            return ListTile(
              title: Text(
                wordPair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        final divided =
            ListTile.divideTiles(tiles: tiles, context: context).toList();
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "Saved Suggestions",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Container(
              color: Colors.black,
              child: ListView(children: divided),
            ));
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "StartUp Name Generator",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
