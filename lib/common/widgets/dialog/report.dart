import 'package:PiliPlus/common/widgets/button/icon_button.dart';
import 'package:PiliPlus/common/widgets/radio_widget.dart';
import 'package:PiliPlus/http/loading_state.dart';
import 'package:PiliPlus/utils/extension/string_ext.dart';
import 'package:PiliPlus/utils/utils.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_ui/material_ui.dart';

typedef ReasonCheck = bool Function(int? reasonType);

bool _kReportCheck(int? reasonType) => reasonType == 0;

typedef OnReport = Future<LoadingState> Function(
  int reasonType,
  String? reasonDesc,
  bool banUid,
);

Future<void> autoWrapReportDialog(
  BuildContext context,
  Map<String, Map<int, String>> options,
  OnReport onReport, {
  bool ban = true,
  String? reportUrl,
  ReasonCheck withContent = _kReportCheck,
  ReasonCheck contentRequired = _kReportCheck,
}) {
  int? reasonType;
  String? reasonDesc;
  bool banUid = false;
  late final key = GlobalKey<FormFieldState<String>>();

  bool isWithContent = withContent(reasonType);
  bool isContentRequired = contentRequired(reasonType);

  void updateReasonType(int? value) {
    reasonType = value;
    isWithContent = withContent(reasonType);
    isContentRequired = contentRequired(reasonType);
    if (isWithContent) {
      key.currentState?.clearError();
    }
  }

  Widget title = const Text('report');
  if (reportUrl != null) {
    title = Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        title,
        iconButton(
          iconSize: 21,
          tooltip: 'Web report',
          onPressed: () =>
              Get.toNamed('/webview', parameters: {'url': reportUrl}),
          icon: const Icon(MdiIcons.web, size: 22),
        ),
      ],
    );
  }

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: title,
      titlePadding: const .only(left: 22, top: 16, right: 22),
      contentPadding: const .symmetric(vertical: 5),
      actionsPadding: const .only(left: 16, right: 16, bottom: 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: Builder(
                  builder: (context) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: .only(left: 22, right: 22, bottom: 5),
                        child: Text('Please select the reason for reporting:'),
                      ),
                      RadioGroup(
                        onChanged: (value) {
                          updateReasonType(value);
                          (context as Element).markNeedsBuild();
                        },
                        groupValue: reasonType,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: options.entries.map((entry) {
                            return WrapRadioOptionsGroup<int>(
                              groupTitle: entry.key,
                              options: entry.value,
                            );
                          }).toList(),
                        ),
                      ),
                      if (isWithContent)
                        Padding(
                          padding: const .only(left: 22, top: 5, right: 22),
                          child: TextFormField(
                            key: key,
                            minLines: 2,
                            maxLines: 4,
                            initialValue: reasonDesc,
                            autofocus: isContentRequired,
                            decoration: const InputDecoration(
                              labelText: 'To help reviewers process it faster, please provide detailed information such as the type of problem and where it occurs.',
                              border: OutlineInputBorder(),
                              contentPadding: .all(10),
                              labelStyle: TextStyle(fontSize: 14),
                              floatingLabelStyle: TextStyle(fontSize: 14),
                            ),
                            onChanged: (value) => reasonDesc = value,
                            validator: (value) =>
                                isContentRequired && value.isNullOrEmpty
                                ? 'Reason cannot be empty'
                                : null,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (ban)
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 6),
              child: CheckBoxText(
                text: 'Block this user',
                onChanged: (value) => banUid = value,
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: Text(
            'Cancel',
            style: TextStyle(color: ColorScheme.of(context).outline),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (reasonType == null ||
                (isContentRequired && key.currentState?.validate() != true)) {
              return;
            }
            SmartDialog.showLoading();
            try {
              final res = await onReport(
                reasonType!,
                isWithContent ? reasonDesc : null,
                banUid,
              );
              SmartDialog.dismiss();
              if (res.isSuccess) {
                Get.back();
                SmartDialog.showToast('Report successful');
              } else {
                res.toast();
              }
            } catch (e, s) {
              SmartDialog.dismiss();
              SmartDialog.showToast('Submission failed: $e');
              Utils.reportError(e, s);
            }
          },
          child: const Text('Sure'),
        ),
      ],
    ),
  );
}

class CheckBoxText extends StatefulWidget {
  final String text;
  final ValueChanged<bool> onChanged;
  final bool selected;

  const CheckBoxText({
    super.key,
    required this.text,
    required this.onChanged,
    this.selected = false,
  });

  @override
  State<CheckBoxText> createState() => _CheckBoxTextState();
}

class _CheckBoxTextState extends State<CheckBoxText> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return InkWell(
      onTap: () {
        setState(() {
          _selected = !_selected;
          widget.onChanged(_selected);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              size: 22,
              _selected
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              color: _selected
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
            ),
            Text(
              ' ${widget.text}',
              style: TextStyle(color: _selected ? colorScheme.primary : null),
            ),
          ],
        ),
      ),
    );
  }
}

abstract final class ReportOptions {
  // from https://s1.hdslb.com/bfs/seed/jinkela/comment-h5/static/js/605.chunks.js
  static Map<String, Map<int, String>> get commentReport => const {
    'Violate laws and regulations': {9: 'Violation of laws and regulations', 2: 'pornography', 10: 'vulgar', 12: 'gambling scam', 23: 'Illegal information external links'},
    'Rumors and false information': {19: 'Political rumors', 22: 'False information*', 20: 'Rumors about social events'},
    'infringement of personal rights': {7: 'personal attack', 15: 'Invasion of privacy'},
    'harmful to community environment': {
      1: 'spam ads',
      4: 'start a war',
      5: 'spoilers',
      3: 'Refresh the screen',
      8: 'Video is not relevant',
      18: 'Illegal lottery',
      17: 'Adverse information for teenagers',
    },
    'other': {0: 'other*'},
  };
  static bool withContentReply(int? reasonType) => reasonType != null;
  static bool contentRequiredReply(int? reasonType) =>
      reasonType == 0 || reasonType == 22;

  static Map<String, Map<int, String>> get dynamicReport => const {
    '': {
      4: 'spam ads',
      8: 'start a war',
      1: 'pornography',
      5: 'personal attack',
      3: 'Illegal information',
      9: 'Political rumors',
      10: 'Rumors about social events',
      12: 'false information',
      13: 'Illegal information external links',
      0: 'other*',
    },
  };

  static Map<String, Map<int, String>> get danmakuReport => const {
    '': {
      1: 'Illegal and prohibited',
      2: 'Pornographic and vulgar',
      3: 'gambling scam',
      4: 'personal attack',
      5: 'Invasion of privacy',
      6: 'spam ads',
      7: 'start a war',
      8: 'spoilers',
      9: 'Malicious screen spam',
      10: 'Video has nothing to do with',
      12: 'Adverse information for teenagers',
      13: 'Illegal information external links',
      11: 'other*',
    },
  };
  static bool danmakuReportCheck(int? reasonType) => reasonType == 11;

  static Map<String, Map<int, String>> get liveDanmakuReport => const {
    '': {
      1: 'Violation of laws and regulations',
      2: 'Vulgar porn',
      3: 'spam ads',
      4: 'Insults lead to war',
      5: 'Politically sensitive',
      6: 'Adverse information for teenagers',
      0: 'other',
    },
  };
  static bool liveDanmakuReportCheck(int? _) => false;

  static Map<String, Map<int, String>> get imMsgReport => const {
    '': {
      1: 'Pornographic and vulgar',
      2: 'Politically sensitive',
      3: 'Illegal and harmful',
      4: 'Advertising Harassment',
      5: 'personal attack',
      6: 'Scam',
      0: 'Other questions*',
    },
  };
}
