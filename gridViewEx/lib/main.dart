import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'GridView Example',
      home: ListTileSelectExample(), //HomePage()와 ListTileSelectExample() 바꿔가며 결과 보기.
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // // GridView.count를 사용할 때
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: SizedBox(
  //         height: MediaQuery.of(context).size.height,
  //         child: GridView.count(
  //           primary: false,
  //           padding: const EdgeInsets.all(20),
  //           crossAxisSpacing: 10, // 열 사이 공백
  //           mainAxisSpacing: 10, // 행 사이 공백
  //           crossAxisCount: 2, // 열 개수
  //           children: <Widget>[
  //             Container(
  //               padding: const EdgeInsets.all(8), // 내부 Padding
  //               color: Colors.teal[100],
  //               child: const Text("1열 1행"),
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               color: Colors.teal[200],
  //               child: const Text("2열 1행"),
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               color: Colors.teal[300],
  //               child: const Text("1열 2행"),
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               color: Colors.teal[400],
  //               child: const Text("2열 2행"),
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               color: Colors.teal[500],
  //               child: const Text("1열 3행"),
  //             ),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               color: Colors.teal[600],
  //               child: const Text("2열 3행"),
  //             ),
  //           ],
  //         ),
  //       )
  //   );
  // }

  //CustomScrollView 와 SliverGrid를 사용할 때
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SizedBox(
  //       height: MediaQuery.of(context).size.height,
  //       child: CustomScrollView(
  //         primary: false,
  //         slivers: <Widget>[
  //           SliverPadding(
  //             padding: const EdgeInsets.all(20),
  //             sliver: SliverGrid.count(
  //               crossAxisCount: 2,
  //               crossAxisSpacing: 10,
  //               mainAxisSpacing: 10,
  //               children: <Widget>[
  //                             Container(
  //                               padding: const EdgeInsets.all(8), // 내부 Padding
  //                               color: Colors.green[100],
  //                               child: const Text("1열 1행"),
  //                             ),
  //                             Container(
  //                               padding: const EdgeInsets.all(8),
  //                               color: Colors.green[200],
  //                               child: const Text("2열 1행"),
  //                             ),
  //                             Container(
  //                               padding: const EdgeInsets.all(8),
  //                               color: Colors.green[300],
  //                               child: const Text("1열 2행"),
  //                             ),
  //                             Container(
  //                               padding: const EdgeInsets.all(8),
  //                               color: Colors.green[400],
  //                               child: const Text("2열 2행"),
  //                             ),
  //                             Container(
  //                               padding: const EdgeInsets.all(8),
  //                               color: Colors.green[500],
  //                               child: const Text("1열 3행"),
  //                             ),
  //                             Container(
  //                               padding: const EdgeInsets.all(8),
  //                               color: Colors.green[600],
  //                               child: const Text("2열 3행"),
  //                             ),
  //               ],
  //             )
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // RemovePadding을 이용해 상단 Padding 조절 및 GridView.builder 사용
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: MediaQuery.removePadding(
            context: context,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                ),
                itemCount: 300,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.amber,
                    child: Center(child: Text('$index')),
                  );
                })),
      ),
    );
  }
}

class ListTileSelectExample extends StatefulWidget {
  const ListTileSelectExample({super.key});

  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}

class ListTileSelectExampleState extends State<ListTileSelectExample> {
  bool isSelectionMode = false;
  final int listLength = 30; // 리스트 개수
  late List<bool> _selected;
  bool _selectAll = false;
  bool _isGridMode = false;

  @override
  void initState() {
    super.initState();
    initializeSelection(); //화면 시작 시 _selected 선언
  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear(); // 해당 페이지 삭제 시 _selected에 저장 된 값 초기화
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ListTile Example',
          ),
          leading: isSelectionMode
              ? IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                isSelectionMode = false;
              });
              initializeSelection();
            },
          )
              : const SizedBox(),
          actions: <Widget>[
            if (_isGridMode)
              IconButton(
                icon: const Icon(Icons.grid_on),
                onPressed: () {
                  setState(() {
                    _isGridMode = false;
                  });
                },
              )
            else
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  setState(() {
                    _isGridMode = true;
                  });
                },
              ),
            if (isSelectionMode)
              TextButton(
                  child: !_selectAll
                      ? const Text(
                    'select all',
                    style: TextStyle(color: Colors.white),
                  )
                      : const Text(
                    'unselect all',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _selectAll = !_selectAll;
                    setState(() {
                      _selected =
                      List<bool>.generate(listLength, (_) => _selectAll);
                    });
                  }),
          ],
        ),
        body: _isGridMode
            ? GridBuilder(
          isSelectionMode: isSelectionMode,
          selectedList: _selected,
          onSelectionChange: (bool x) {
            setState(() {
              isSelectionMode = x;
            });
          },
        )
            : ListBuilder(
          isSelectionMode: isSelectionMode,
          selectedList: _selected,
          onSelectionChange: (bool x) {
            setState(() {
              isSelectionMode = x;
            });
          },
        ));
  }
}

class GridBuilder extends StatefulWidget {
  const GridBuilder({
    super.key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });

  final bool isSelectionMode;
  final Function(bool)? onSelectionChange;
  final List<bool> selectedList;

  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.selectedList.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () => _toggle(index),
            onLongPress: () {
              if (!widget.isSelectionMode) {
                setState(() {
                  widget.selectedList[index] = true;
                });
                widget.onSelectionChange!(true);
              }
            },
            child: GridTile(
                child: Container(
                  child: widget.isSelectionMode
                      ? Checkbox(
                      onChanged: (bool? x) => _toggle(index),
                      value: widget.selectedList[index])
                      : const Icon(Icons.image),
                )),
          );
        });
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    super.key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });

  final bool isSelectionMode;
  final List<bool> selectedList;
  final Function(bool)? onSelectionChange;

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.selectedList.length,
        itemBuilder: (_, int index) {
          return ListTile(
              onTap: () => _toggle(index),
              onLongPress: () {
                if (!widget.isSelectionMode) {
                  setState(() {
                    widget.selectedList[index] = true;
                  });
                  widget.onSelectionChange!(true);
                }
              },
              trailing: widget.isSelectionMode
                  ? Checkbox(
                value: widget.selectedList[index],
                onChanged: (bool? x) => _toggle(index),
              )
                  : const SizedBox.shrink(),
              title: Text('item $index'));
        });
  }
}
