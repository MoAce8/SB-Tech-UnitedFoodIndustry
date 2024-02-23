// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:unitedfoodindustery/core/constants/colors.dart';

Widget rateStars({
  bool? rate,
  required double itemSize,
  double? rateNum,
}) =>
    RatingBar.builder(
      initialRating: rateNum ?? 4,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize,
      ignoreGestures: rate ?? false,
      unratedColor: colorGreyLight.withOpacity(0.5),
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: print,
    );
