import 'package:PiliPlus/common/widgets/button/icon_button.dart';
import 'package:PiliPlus/http/member.dart';
import 'package:PiliPlus/utils/extension/theme_ext.dart';
import 'package:PiliPlus/utils/theme_utils.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_ui/material_ui.dart';

const _reason = ['Avatar violation', 'Nickname violation', 'signature violation'];

const _reasonV2 = ['Pornographic and vulgar', 'False information', 'Prohibited', 'personal attack', 'gambling scam', 'Illegal external links'];

Future<void> showMemberReportDialog(
  BuildContext context, {
  required Object? name,
  required Object mid,
}) {
  final Set<int> reason = {};
  int? reasonV2;

  return showDialog(
    context: context,
    builder: (context) {
      final theme = Theme.of(context);
      return AlertDialog(
        clipBehavior: Clip.hardEdge,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        titleTextStyle: theme.textTheme.bodyMedium,
        title: Row(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Report: $name',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text('uid: $mid'),
                ],
              ),
            ),
            iconButton(
              iconSize: 21,
              tooltip: 'Web report',
              onPressed: () => Get.toNamed(
                '/webview',
                parameters: {
                  'url':
                      'https://account.bilibili.com/h5/account-h5/gr/report?navhide=1&targetmid=$mid&${ThemeUtils.themeUrl(theme.isDark)}',
                },
              ),
              icon: const Icon(MdiIcons.web),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              const Padding(
                padding: .only(left: 18),
                child: Text('Report content (required, multiple choices available)'),
              ),
              ...List.generate(
                3,
                (index) => Builder(
                  builder: (context) {
                    final checked = reason.contains(index + 1);
                    return ListTile(
                      dense: true,
                      minTileHeight: 40,
                      onTap: () {
                        if (!checked) {
                          reason.add(index + 1);
                        } else {
                          reason.remove(index + 1);
                        }
                        (context as Element).markNeedsBuild();
                      },
                      title: Row(
                        spacing: 8,
                        children: [
                          checked
                              ? Icon(
                                  size: 22,
                                  Icons.check_box,
                                  color: theme.colorScheme.primary,
                                )
                              : Icon(
                                  size: 22,
                                  Icons.check_box_outline_blank,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                          Expanded(
                            child: Text(
                              _reason[index],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: .only(left: 18),
                child: Text('Reason for reporting (single choice, optional)'),
              ),
              Builder(
                builder: (context) => Column(
                  crossAxisAlignment: .start,
                  children: List.generate(
                    _reasonV2.length,
                    (index) {
                      final checked = index == reasonV2;
                      return ListTile(
                        dense: true,
                        minTileHeight: 40,
                        onTap: () {
                          if (checked) {
                            reasonV2 = null;
                          } else {
                            reasonV2 = index;
                          }
                          (context as Element).markNeedsBuild();
                        },
                        title: Row(
                          spacing: 8,
                          children: [
                            checked
                                ? Icon(
                                    size: 22,
                                    Icons.radio_button_checked,
                                    color: theme.colorScheme.primary,
                                  )
                                : Icon(
                                    size: 22,
                                    Icons.radio_button_off,
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                            Expanded(
                              child: Text(
                                _reasonV2[index],
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: Text(
              'Cancel',
              style: TextStyle(color: theme.colorScheme.outline),
            ),
          ),
          TextButton(
            onPressed: () {
              if (reason.isEmpty) {
                SmartDialog.showToast('Select at least one item to report');
              } else {
                Get.back();
                MemberHttp.reportMember(
                  mid,
                  reason: reason.join(','),
                  reasonV2: reasonV2 != null ? reasonV2! + 1 : null,
                );
              }
            },
            child: const Text('Sure'),
          ),
        ],
      );
    },
  );
}
