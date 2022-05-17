import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_paper/domain/entity/support_data.dart';
import 'package:news_paper/presentation/pages/support_page/widget/audio_bubble.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';

class MassageCrd extends StatelessWidget {
  final double fontSize;
  final bool isLight;
  final int index;
  final List<SupportData> supportMassage;

  const MassageCrd({
    required this.fontSize,
    required this.index,
    required this.isLight,
    required this.supportMassage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index == supportMassage.length
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          )
        : supportMassage[index].files != null
            ? AudioBubble(
                filepath: supportMassage[index].files!, //AudioState.files[index],
                key: ValueKey(supportMassage[index].files!),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    margin: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.black.withOpacity(0.3),
                      ),
                      color: AppColors.mainColorDarkTwo.withOpacity(0.2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        supportMassage[index].image == emptyString
                            ? const SizedBox()
                            : Image.file(
                                File(
                                  supportMassage[index].image!,
                                ),
                                height: 100.0,
                                width: 100.0),
                        Text(
                          supportMassage[index].data!,
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 16.0 * fontSize,
                            color: isLight ? AppColors.white : AppColors.black,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            supportMassage[index].time!,
                            style: TextStyle(
                              fontFamily: fontFamily,
                              fontSize: 7.0 * fontSize,
                              color: isLight ? AppColors.white : AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
  }
}
