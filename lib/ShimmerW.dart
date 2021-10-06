import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerW extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerW.rectangular({
    this.width = double.infinity,
    required this.height,
  }) : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerW.circular({
    required this.width,
    required this.height,
    this.shapeBorder = const CircleBorder(),
  });
  
  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    child: Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.grey[400]!,
        shape: shapeBorder
      ),
      
    ), 
    baseColor: Colors.grey[400]!, 
    highlightColor: Colors.grey[300]!
    ); 
}