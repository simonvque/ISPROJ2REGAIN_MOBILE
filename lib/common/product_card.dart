import 'package:flutter/material.dart';
import 'package:regain_mobile/common/rounded_container.dart';
import 'package:regain_mobile/common/rounded_image.dart';
import 'package:regain_mobile/common/styles/shadows.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/constants/sizes.dart';

import 'circle_container.dart';

class ReGainProductCard extends StatelessWidget{
  const ReGainProductCard({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [ReGainShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(ReGainSizes.productImageRadius),
        color: white
      ),

      child: Column(
        children: [
          //Thumbnail
          ReGainRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(ReGainSizes.sm),
            backgroundColor: white,
          ),
          //Details
        ],
      ),
    );
  }
}