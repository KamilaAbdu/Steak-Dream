import 'package:flutter/material.dart';
import 'package:steak_dream/core/l10n/generated/l10n.dart';

extension ContextExtension on BuildContext {
  L10ns get lang => L10ns.of(this);
}
