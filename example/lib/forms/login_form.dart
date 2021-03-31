import 'package:flutter_auto_form/flutter_auto_form.dart';

class LoginForm extends TemplateForm {
  LoginForm()
      : fields = [
          AutoFormTextField(
            'identifier',
            'Identifier',
            [
              MinimumStringLengthValidator(
                5,
                (e) => 'Min 5 characters, currently ${e.length} ',
              )
            ],
            AutoFormTextFieldType.USERNAME,
          ),
          AutoFormTextField(
            'password',
            'Password',
            [
              MinimumStringLengthValidator(
                6,
                (e) => 'Min 6 characters, currently ${e.length} ',
              )
            ],
            AutoFormTextFieldType.PASSWORD,
          )
        ];

  final List<Field> fields;
}