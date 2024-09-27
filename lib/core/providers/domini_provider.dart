import 'package:flutter/cupertino.dart';

import '../constants/image_assets.dart';
import '../constants/strings.dart';
import '../models/doc_model.dart';

/// Provider Class for domini data
class DominiProvider extends ChangeNotifier {

  List<String> dominiImages = [
    ImageAssets.towerImage,
    ImageAssets.towerImage,
    ImageAssets.towerImage,
    ImageAssets.towerImage,
    ImageAssets.towerImage,
    ImageAssets.towerImage,
    ImageAssets.towerImage,
    ImageAssets.towerImage,
  ];

  List<DocModel> docModelList = [
    DocModel(title: Strings.docTitle1, date: 'Dec 4, 2024', docType: DocType.doc),
    DocModel(title: Strings.docTitle2, date: 'Dec 3, 2024', docType: DocType.exel),
    DocModel(title: Strings.docTitle3, date: 'Dec 2, 2024', docType: DocType.ppt),
    DocModel(title: Strings.docTitle1, date: 'Dec 4, 2024', docType: DocType.doc),
    DocModel(title: Strings.docTitle2, date: 'Dec 3, 2024', docType: DocType.exel),
    DocModel(title: Strings.docTitle3, date: 'Dec 2, 2024', docType: DocType.ppt),
    DocModel(title: Strings.docTitle1, date: 'Dec 4, 2024', docType: DocType.doc),
    DocModel(title: Strings.docTitle2, date: 'Dec 3, 2024', docType: DocType.exel),
    DocModel(title: Strings.docTitle3, date: 'Dec 2, 2024', docType: DocType.ppt),
    DocModel(title: Strings.docTitle1, date: 'Dec 4, 2024', docType: DocType.doc),
    DocModel(title: Strings.docTitle2, date: 'Dec 3, 2024', docType: DocType.exel),
    DocModel(title: Strings.docTitle3, date: 'Dec 2, 2024', docType: DocType.ppt),
    DocModel(title: Strings.docTitle1, date: 'Dec 4, 2024', docType: DocType.doc),
    DocModel(title: Strings.docTitle2, date: 'Dec 3, 2024', docType: DocType.exel),
    DocModel(title: Strings.docTitle3, date: 'Dec 2, 2024', docType: DocType.ppt),
  ];
}
