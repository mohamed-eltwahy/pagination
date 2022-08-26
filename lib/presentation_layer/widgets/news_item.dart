import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../apptext.dart';
import '../../data_layer/models/passengersmodel.dart';

class NewsItem extends StatelessWidget {
Data? listpass;
   NewsItem({Key? key, this.listpass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 150,
                width: 180,
                decoration:
                 BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                       image:  DecorationImage(image: NetworkImage(listpass!.airline![0].logo!),fit: BoxFit.cover
                       )
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(listpass!.name!),
                 Flexible(
              child: Text(listpass!.trips!.toString(), maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
            ),
                  AppText(listpass!.sId!),
                ],
              ),
            )
          ],
        ));
    // return Row(children: [
    //   Container(
    //     height: 160,
    //     width: double.infinity,
    //     decoration:const BoxDecoration(
    //       image:  DecorationImage(
    //         image: ExactAssetImage('assets/images/Group 5442@3x.png'),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     child: Image.asset('assets/images/5TRrpRAGc@3x.png',),
    //   )

    // ],);
  }
}
