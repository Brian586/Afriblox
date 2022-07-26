class PaintTool {
  final String? name;
  final String? imageUrl;

  PaintTool({this.name, this.imageUrl});
}

final List<PaintTool> paintTools = [
  PaintTool(
    name: "Select",
    imageUrl: "assets/icons/select.svg"
  ),
  PaintTool(
      name: "Reshape",
      imageUrl: "assets/icons/reshape.svg"
  ),
  PaintTool(
      name: "Brush",
      imageUrl: "assets/icons/brush.svg"
  ),
  PaintTool(
      name: "Eraser",
      imageUrl: "assets/icons/eraser.svg"
  ),
  PaintTool(
      name: "Fill",
      imageUrl: "assets/icons/fill.svg"
  ),
  PaintTool(
      name: "Text",
      imageUrl: "assets/icons/text.svg"
  ),
  PaintTool(
      name: "Line",
      imageUrl: "assets/icons/line.svg"
  ),
  PaintTool(
      name: "Circle",
      imageUrl: "assets/icons/oval_outlined.svg"
  ),
  PaintTool(
      name: "Rectangle",
      imageUrl: "assets/icons/rectangle_outlined.svg"
  ),
];