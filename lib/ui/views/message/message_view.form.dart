// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String MessageValueKey = 'message';

final Map<String, TextEditingController> _MessageViewTextEditingControllers =
    {};

final Map<String, FocusNode> _MessageViewFocusNodes = {};

final Map<String, String? Function(String?)?> _MessageViewTextValidations = {
  MessageValueKey: null,
};

mixin $MessageView {
  TextEditingController get messageController =>
      _getFormTextEditingController(MessageValueKey);

  FocusNode get messageFocusNode => _getFormFocusNode(MessageValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_MessageViewTextEditingControllers.containsKey(key)) {
      return _MessageViewTextEditingControllers[key]!;
    }

    _MessageViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _MessageViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_MessageViewFocusNodes.containsKey(key)) {
      return _MessageViewFocusNodes[key]!;
    }
    _MessageViewFocusNodes[key] = FocusNode();
    return _MessageViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    messageController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    messageController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          MessageValueKey: messageController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _MessageViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _MessageViewFocusNodes.values) {
      focusNode.dispose();
    }

    _MessageViewTextEditingControllers.clear();
    _MessageViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get messageValue => this.formValueMap[MessageValueKey] as String?;

  set messageValue(String? value) {
    this.setData(
      this.formValueMap..addAll({MessageValueKey: value}),
    );

    if (_MessageViewTextEditingControllers.containsKey(MessageValueKey)) {
      _MessageViewTextEditingControllers[MessageValueKey]?.text = value ?? '';
    }
  }

  bool get hasMessage =>
      this.formValueMap.containsKey(MessageValueKey) &&
      (messageValue?.isNotEmpty ?? false);

  bool get hasMessageValidationMessage =>
      this.fieldsValidationMessages[MessageValueKey]?.isNotEmpty ?? false;

  String? get messageValidationMessage =>
      this.fieldsValidationMessages[MessageValueKey];
}

extension Methods on FormStateHelper {
  setMessageValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MessageValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    messageValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      MessageValueKey: getValidationMessage(MessageValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _MessageViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _MessageViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      MessageValueKey: getValidationMessage(MessageValueKey),
    });
