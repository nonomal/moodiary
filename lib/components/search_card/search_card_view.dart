import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mood_diary/common/models/isar/diary.dart';

import 'search_card_logic.dart';

class SearchCardComponent extends StatelessWidget {
  const SearchCardComponent({super.key, required this.diary, required this.index});

  final Diary diary;
  final String index;

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SearchCardLogic());

    final colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<SearchCardLogic>(
      init: logic,
      tag: index,
      assignId: true,
      builder: (logic) {
        return InkWell(
          onTap: () {
            logic.toDiaryPage(diary);
          },
          child: Container(
            decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest, borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        diary.contentText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(diary.time.toString().split('.')[0])
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
