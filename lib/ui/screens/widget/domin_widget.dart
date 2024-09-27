import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/strings.dart';
import '../../../core/providers/domini_provider.dart';

/// Class to load domini widget
class DominWidget extends StatelessWidget {
  const DominWidget({super.key});

  /// Build method to load ui
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.all(16.0),
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
                  Strings.domiIn,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.white)
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 80,
            child: Consumer<DominiProvider>(builder: (ct, provider, child) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.dominiImages.length,
                itemBuilder: (ct, index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(provider.dominiImages[index], height: 80, width: 80, fit: BoxFit.cover),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
