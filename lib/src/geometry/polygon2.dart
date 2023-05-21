import 'dart:math';

import 'package:croppy/src/src.dart';

class Polygon2 {
  const Polygon2(this.vertices);

  final List<Vector2> vertices;

  Aabb2 get boundingBox {
    final minX = vertices.map((v) => v.x).reduce(min);
    final maxX = vertices.map((v) => v.x).reduce(max);
    final minY = vertices.map((v) => v.y).reduce(min);
    final maxY = vertices.map((v) => v.y).reduce(max);

    return Aabb2.minMax(
      Vector2(minX, minY),
      Vector2(maxX, maxY),
    );
  }

  Polygon2 shift(Vector2 d) {
    return Polygon2(vertices.map((v) => v + d).toList());
  }

  List<LineSegment2> get lineSegments {
    final segments = <LineSegment2>[];

    for (var i = 0; i < vertices.length; i++) {
      final j = (i + 1) % vertices.length;
      segments.add(LineSegment2(vertices[i], vertices[j]));
    }

    return segments;
  }
}
