import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auto_form/src/models/form.dart';
import 'package:flutter_auto_form/src/widgets/form_state.dart';

class AutoFormWidget<T extends TemplateForm> extends StatefulWidget {
  const AutoFormWidget({
    Key? key,
    required this.formBuilder,
    required this.onSubmitted,
    this.submitButton,
    this.handleErrorOnSubmit,
  }) : super(key: key);

  final T Function() formBuilder;

  final Function(T form) onSubmitted;

  final ValueChanged<String>? handleErrorOnSubmit;

  final Widget Function(Function(bool showLoadingDialog) submit)? submitButton;

  @override
  _AutoFormWidgetState<T> createState() => _AutoFormWidgetState<T>(
        formBuilder(),
        handleErrorOnSubmit: handleErrorOnSubmit,
      );
}

class _AutoFormWidgetState<T extends TemplateForm>
    extends AutoFormWidgetState<AutoFormWidget<T>, T> {
  _AutoFormWidgetState(T model, {ValueChanged<String>? handleErrorOnSubmit})
      : super(model: model, handleErrorOnSubmit: handleErrorOnSubmit);

  @override
  Widget build(BuildContext context) {
    widget;
    Widget child = form();

    if (widget.submitButton != null) {
      child = Column(
        children: [
          child,
          widget.submitButton!(
            (bool showLoadingDialog) => submitForm(
              showLoading: showLoadingDialog,
            ),
          )
        ],
      );
    }

    return child;
  }

  @override
  FutureOr<void> submit(T form) => widget.onSubmitted(form);
}
