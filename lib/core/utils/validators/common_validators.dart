import 'validator_typedef.dart';

Validator requiredField = (value) {
  if (value == null || value.isEmpty) {
    return "Field is required";
  }
  return null;
};
