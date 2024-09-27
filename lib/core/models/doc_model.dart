/// Class for Document Model
class DocModel {
  final String title;
  final String date;
  final DocType docType;

  /// Constructor for initial value and object
  DocModel({required this.title, required this.date, required this.docType});
}

/// Enum for document type
enum DocType { doc, exel, ppt }
