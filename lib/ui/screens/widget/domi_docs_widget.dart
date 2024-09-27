import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/strings.dart';
import '../../../core/providers/domini_provider.dart';
import 'domi_doc_row_widget.dart';

/// Class to load domini docs widget
class DomiDocsWidget extends StatelessWidget {
  const DomiDocsWidget({super.key});

  /// Build method to load ui
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: Text(
                  Strings.domiDocs,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.white)
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(24.0)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24.0), borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24.0), borderSide: BorderSide(color: Colors.transparent)),
              filled: true,
              fillColor: Colors.black26,
              hintText: Strings.searchDocs,
              hintStyle: TextStyle(color: Colors.white54),
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            ),
          ),
          const SizedBox(height: 8),
          Consumer<DominiProvider>(
            builder: (ct, provider, child) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.docModelList.length,
                itemBuilder: (ct, index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: DomiDocRowWidget(docModel: provider.docModelList[index]),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
