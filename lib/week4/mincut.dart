import 'dart:math';

import 'package:tuple/tuple.dart';

Map<int, List<int>> mincut(Map<int, List<int>> graph) {
  final Map<int, List<int>> g = deepCopy(graph);
  int n = g.length;
  Tuple2<int, int> edgeToContract;

  while (n > 2) {
    edgeToContract = chooseEdge(g);
    contract(g, edgeToContract);

    n -= 1;
  }

  return g;
}

Map<int, List<int>> deepCopy(Map<int, List<int>> graph) {
  final Map<int, List<int>> g = Map<int, List<int>>.from(graph);
  for (int key in g.keys) {
    g[key] = List<int>.from(g[key]);
  }

  return g;
}

Tuple2<int, int> chooseEdge(Map<int, List<int>> graph) {
  final Random random = Random();
  final int u = graph.keys.elementAt(random.nextInt(graph.length));
  final List<int> uEdgeList = graph[u];
  final int v = uEdgeList[random.nextInt(uEdgeList.length)];

  return Tuple2<int, int>(u, v);
}

void contract(Map<int, List<int>> graph, Tuple2<int, int> edgeToContract) {
  int u = edgeToContract.item1;
  int v = edgeToContract.item2;
  final int uDegree = graph[u].length;
  final int vDegree = graph[v].length;

  if (vDegree > uDegree) {
    final int temp = u;
    u = v;
    v = temp;
  }

  graph[u].addAll(graph[v]);

  List<int> elementList;
  for (int element in graph[v]) {
    elementList = graph[element];

    for (int i = 0; i < elementList.length; i++) {
      if (elementList[i] == v) {
        elementList[i] = u;
      }
    }
  }

  graph[u].removeWhere((int item) => item == u);
  graph.remove(v);
}
