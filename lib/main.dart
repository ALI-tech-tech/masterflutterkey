import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeyExamplesDemo(),
    );
  }
}

class KeyExamplesDemo extends StatefulWidget {
  @override
  _KeyExamplesDemoState createState() => _KeyExamplesDemoState();
}

class _KeyExamplesDemoState extends State<KeyExamplesDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _valueKeyItems = ['Item A', 'Item B', 'Item C'];
  final List<Item> _objectKeyItems = [
    Item(id: 1, name: 'Custom Item 1'),
    Item(id: 2, name: 'Custom Item 2'),
    Item(id: 3, name: 'Custom Item 3'),
  ];
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Keys Examples'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Form (GlobalKey)'),
              Tab(text: 'Lists (ValueKey & ObjectKey)'),
              Tab(text: 'Scroll (PageStorageKey)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFormWithGlobalKey(),
            _buildListsWithKeys(),
            _buildScrollPreservation(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // Example: GlobalKey
  Widget _buildFormWithGlobalKey() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Enter your name'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter your name' : null,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form is valid!')),
                  );
                }
              },
              child: const Text('Validate Form'),
            ),
          ],
        ),
      ),
    );
  }

  // Example: ValueKey and ObjectKey
  Widget _buildListsWithKeys() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: _valueKeyItems
                .map(
                  (item) => ListTile(
                    key: ValueKey(item),
                    title: Text(item),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: ListView(
            children: _objectKeyItems
                .map(
                  (item) => ListTile(
                    key: ObjectKey(item),
                    title: Text(item.name),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  // Example: PageStorageKey
  Widget _buildScrollPreservation() {
    return Column(
      children: [
        Text('Counter: $_counter'),
        Expanded(
          child: TabBarView(
            children: [
              ListView.builder(
                key: const PageStorageKey('list1'),
                itemCount: 30,
                itemBuilder: (context, index) => ListTile(
                  title: Text('List 1 - Item $index'),
                ),
              ),
              ListView.builder(
                key: const PageStorageKey('list2'),
                itemCount: 30,
                itemBuilder: (context, index) => ListTile(
                  title: Text('List 2 - Item $index'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Custom class for ObjectKey example
class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
