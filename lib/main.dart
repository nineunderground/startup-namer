// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// TODO: https://flutter.dev/docs/get-started/codelab (Step 3)
// https://flutter.dev/docs/get-started/codelab#step-3-add-a-stateful-widget

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// void main() => runApp(MyApp()); // ONE-LINE MODE
void main() {
  return runApp(MyApp());
}

// Class with the application code
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter',
      home: RandomWords(),
    );
  }
}

// Custom class RandomWords
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
  // @override
  // RandomWordsState createState() => RandomWordsState();
}

// Class state for custom class RandomWords
class RandomWordsState extends State<RandomWords> {
  // Prefixing an identifier with an underscore enforces privacy
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // 30 callbacks, i.e. itemBuilder, and then increases as long as user scrolls down
          // Adds a divider
          if (i.isOdd) return Divider();

          // Adds a random word
          final index = i ~/ 2;
          //print('\nINDEX: $index');
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          //if (i > 3) return null;
          //print('\nCALLBACK: $i');

          // Returns a ListTile
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
