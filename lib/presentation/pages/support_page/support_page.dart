import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:news_paper/domain/entity/support_data.dart';
import 'package:news_paper/presentation/pages/support_page/support_page_vm.dart';
import 'package:news_paper/presentation/pages/support_page/widget/massage_crd.dart';
import 'package:news_paper/presentation/pages/support_page/widget/record_button.dart';
import 'package:news_paper/presentation/widgets/custom_text_field.dart';
import 'package:news_paper/res/app_consts.dart';
import 'package:news_paper/res/app_styles.dart';
import 'package:news_paper/store/application/app_state.dart';

class SupportPage extends StatefulWidget {
  final bool isLight;
  final double fontSize;

  const SupportPage({
    required this.isLight,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> with SingleTickerProviderStateMixin {
  late XFile _image;
  String imagePass = emptyString;
  bool isTapKeyBord = true;

  Future getImage(bool isCamera) async {
    XFile image;
    if (isCamera) {
      image = (await ImagePicker().pickImage(source: ImageSource.camera)) as XFile;
    } else {
      image = (await ImagePicker().pickImage(source: ImageSource.gallery)) as XFile;
    }
    setState(() {
      _image = image;
      imagePass = image.path;
    });
  }

  final TextEditingController _myTextController = TextEditingController();
  late AnimationController controller;

  void _printLatestValue() {
    if (_myTextController.text == emptyString && imagePass == emptyString) {
      setState(() {
        isTapKeyBord = true;
      });
    } else {
      setState(() {
        isTapKeyBord = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _myTextController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    _myTextController.dispose();

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SupportPageVM>(
        converter: SupportPageVM.init,
        builder: (context, vm) {
          return Scaffold(
            backgroundColor: widget.isLight ? AppColors.grey : AppColors.white,
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.titleS,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 20.0 * widget.fontSize,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              backgroundColor: widget.isLight ? AppColors.grey : null,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Stack(
                children: [
                  const SizedBox(width: 4),
                  vm.supportMassage.isEmpty
                      ? Center(
                          child: Text(
                            AppLocalizations.of(context)!.emptyText,
                            style: TextStyle(
                              color: AppColors.marigold,
                              fontSize: 24 * widget.fontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: vm.supportMassage.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            return MassageCrd(
                              fontSize: widget.fontSize,
                              index: index,
                              isLight: widget.isLight,
                              supportMassage: vm.supportMassage,
                            );
                          }),
                  Align(
                    alignment: const Alignment(-1, 0.75),
                    child: imagePass != emptyString
                        ? Container(
                            height: 135.0,
                            padding: const EdgeInsets.all(5.0),
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
                                InkWell(
                                  child: const Icon(
                                    Icons.clear,
                                    size: 18,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      imagePass = emptyString;
                                    });
                                  },
                                ),
                                Image.file(File(_image.path), fit: BoxFit.cover, height: 100.0, width: 100.0),
                              ],
                            ))
                        : const SizedBox(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.59,
                            child: CustomTextField(
                              controller: _myTextController,
                              keyValue: key,
                            ),
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.insert_drive_file_outlined,
                            ),
                            onTap: () {
                              getImage(false);
                            },
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.camera_alt_outlined,
                            ),
                            onTap: () {
                              getImage(true);
                            },
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          if (!isTapKeyBord)
                            SizedBox(
                              width: 45.0,
                              child: InkWell(
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                                onTap: () {
                                  vm.addMassage(
                                    SupportData(
                                      image: imagePass,
                                      data: _myTextController.text,
                                      time: DateFormat.jm().format(DateTime.now()),
                                    ),
                                  );
                                  imagePass = emptyString;
                                  _myTextController.clear();
                                },
                              ),
                            ),
                          if (isTapKeyBord) RecordButton(controller: controller),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
