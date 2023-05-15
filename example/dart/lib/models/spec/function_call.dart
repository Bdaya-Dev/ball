import 'package:pub_semver/pub_semver.dart';

import 'impl_body.dart';

abstract class BallFunctionCallInputMappingBase {
  const BallFunctionCallInputMappingBase();
}

class VariableInputMapping extends BallFunctionCallInputMappingBase {
  final String variableName;

  VariableInputMapping({required this.variableName});
}

class ValueInputMapping extends BallFunctionCallInputMappingBase {
  final Object? value;
  const ValueInputMapping({required this.value});
}

/// Represents a function call
class BallFunctionCall extends BallFunctionImplementationBody {
  /// The local or global function name
  final Uri uri;

  /// Maps input argument names with actual values.
  /// The values must conform to the json schema defined in [BallArgumentDef.type]
  final Map<String, BallFunctionCallInputMappingBase> inputMapping;

  /// Maps output arguments from that function to new names to avoid conflicts
  final Map<String, String> outputVariableMapping;

  final VersionConstraint? constraint;

  const BallFunctionCall({
    required this.uri,
    this.inputMapping = const {},
    this.outputVariableMapping = const {},
    this.constraint,
  });
}