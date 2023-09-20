
import 'package:flutter/material.dart';

class ImageData{

  Image image;
  Size size;

  double left;
  double top;
  double? right;
  double? bottom;

  Color color;

  ImageData(this.image,this.size,this.left,this.top,this.color,{this.right,this.bottom});

}