mixin JsonMappable {
  Map<String, dynamic> mergeAttr(item, {included = const []}) {
    var attrs = {
      "id": item?['id'],
      "relationships": item?['relationships'],
      "included": included,
    };
    attrs.addAll(item?['attributes'] ?? {});
    return attrs;
  }
}
