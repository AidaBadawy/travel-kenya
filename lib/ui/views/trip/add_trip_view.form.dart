// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameValueKey = 'name';
const String PlaceValueKey = 'place';
const String StartDateValueKey = 'startDate';
const String EndDateValueKey = 'endDate';

final Map<String, TextEditingController> _AddTripViewTextEditingControllers =
    {};

final Map<String, FocusNode> _AddTripViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddTripViewTextValidations = {
  NameValueKey: null,
  PlaceValueKey: null,
  StartDateValueKey: null,
  EndDateValueKey: null,
};

mixin $AddTripView {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get placeController =>
      _getFormTextEditingController(PlaceValueKey);
  TextEditingController get startDateController =>
      _getFormTextEditingController(StartDateValueKey);
  TextEditingController get endDateController =>
      _getFormTextEditingController(EndDateValueKey);

  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get placeFocusNode => _getFormFocusNode(PlaceValueKey);
  FocusNode get startDateFocusNode => _getFormFocusNode(StartDateValueKey);
  FocusNode get endDateFocusNode => _getFormFocusNode(EndDateValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddTripViewTextEditingControllers.containsKey(key)) {
      return _AddTripViewTextEditingControllers[key]!;
    }

    _AddTripViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddTripViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddTripViewFocusNodes.containsKey(key)) {
      return _AddTripViewFocusNodes[key]!;
    }
    _AddTripViewFocusNodes[key] = FocusNode();
    return _AddTripViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameController.addListener(() => _updateFormData(model));
    placeController.addListener(() => _updateFormData(model));
    startDateController.addListener(() => _updateFormData(model));
    endDateController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    placeController.addListener(() => _updateFormData(model));
    startDateController.addListener(() => _updateFormData(model));
    endDateController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
          PlaceValueKey: placeController.text,
          StartDateValueKey: startDateController.text,
          EndDateValueKey: endDateController.text,
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

    for (var controller in _AddTripViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddTripViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddTripViewTextEditingControllers.clear();
    _AddTripViewFocusNodes.clear();
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

  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get placeValue => this.formValueMap[PlaceValueKey] as String?;
  String? get startDateValue => this.formValueMap[StartDateValueKey] as String?;
  String? get endDateValue => this.formValueMap[EndDateValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_AddTripViewTextEditingControllers.containsKey(NameValueKey)) {
      _AddTripViewTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  set placeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PlaceValueKey: value}),
    );

    if (_AddTripViewTextEditingControllers.containsKey(PlaceValueKey)) {
      _AddTripViewTextEditingControllers[PlaceValueKey]?.text = value ?? '';
    }
  }

  set startDateValue(String? value) {
    this.setData(
      this.formValueMap..addAll({StartDateValueKey: value}),
    );

    if (_AddTripViewTextEditingControllers.containsKey(StartDateValueKey)) {
      _AddTripViewTextEditingControllers[StartDateValueKey]?.text = value ?? '';
    }
  }

  set endDateValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EndDateValueKey: value}),
    );

    if (_AddTripViewTextEditingControllers.containsKey(EndDateValueKey)) {
      _AddTripViewTextEditingControllers[EndDateValueKey]?.text = value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasPlace =>
      this.formValueMap.containsKey(PlaceValueKey) &&
      (placeValue?.isNotEmpty ?? false);
  bool get hasStartDate =>
      this.formValueMap.containsKey(StartDateValueKey) &&
      (startDateValue?.isNotEmpty ?? false);
  bool get hasEndDate =>
      this.formValueMap.containsKey(EndDateValueKey) &&
      (endDateValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasPlaceValidationMessage =>
      this.fieldsValidationMessages[PlaceValueKey]?.isNotEmpty ?? false;
  bool get hasStartDateValidationMessage =>
      this.fieldsValidationMessages[StartDateValueKey]?.isNotEmpty ?? false;
  bool get hasEndDateValidationMessage =>
      this.fieldsValidationMessages[EndDateValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get placeValidationMessage =>
      this.fieldsValidationMessages[PlaceValueKey];
  String? get startDateValidationMessage =>
      this.fieldsValidationMessages[StartDateValueKey];
  String? get endDateValidationMessage =>
      this.fieldsValidationMessages[EndDateValueKey];
}

extension Methods on FormStateHelper {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setPlaceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PlaceValueKey] = validationMessage;
  setStartDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StartDateValueKey] = validationMessage;
  setEndDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EndDateValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    placeValue = '';
    startDateValue = '';
    endDateValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      PlaceValueKey: getValidationMessage(PlaceValueKey),
      StartDateValueKey: getValidationMessage(StartDateValueKey),
      EndDateValueKey: getValidationMessage(EndDateValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddTripViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddTripViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      PlaceValueKey: getValidationMessage(PlaceValueKey),
      StartDateValueKey: getValidationMessage(StartDateValueKey),
      EndDateValueKey: getValidationMessage(EndDateValueKey),
    });
