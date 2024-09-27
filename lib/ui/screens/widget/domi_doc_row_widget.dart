import 'package:flutter/material.dart';

import '../../../core/constants/image_assets.dart';
import '../../../core/models/doc_model.dart';

/// Class for domini doc row widget of list
class DomiDocRowWidget extends StatelessWidget {
  const DomiDocRowWidget({super.key, required this.docModel});

  final DocModel docModel;

  /// Build method to load ui
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Image.asset(_imageWidget(docModel.docType), height: 32, fit: BoxFit.fitHeight),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(docModel.title, style: TextStyle(color: Colors.white)),
                const SizedBox(height: 2),
                Text(docModel.date, style: TextStyle(color: Colors.white54)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Method to return image asset based in doc tyoe
  String _imageWidget(DocType docType) {
    switch (docType) {
      case DocType.doc:
        return ImageAssets.docImage;
      case DocType.ppt:
        return ImageAssets.pptImage;
      case DocType.exel:
        return ImageAssets.xlsImage;
      default:
        return ImageAssets.docImage;
    }
  }
}
