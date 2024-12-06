import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/error_form_message.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/otp/otp_screen.dart';
import 'package:ui_ecommerce/size_config.dart';


class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          firstNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          lastNameFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          phoneNumberFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          addressFormField(),
          ErorrFormMessage(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          MyDefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }

              if (errors.isEmpty) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField addressFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        }
      },
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        }
        return '';
      },
      decoration: InputDecoration(
        labelText: 'Address',
        hintText: 'Enter your Address',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(16)),
          child: const Icon(Icons.email_outlined),
        ),
      ),
    );
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
      },
      onSaved: (newValue) => phoneNumber = newValue,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
        }
        return '';
      },
      decoration: InputDecoration(
        labelText: 'Phone Number',
        hintText: 'Enter your Phone Number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(16)),
          child: const Icon(Icons.phone_outlined),
        ),
      ),
    );
  }

  TextFormField lastNameFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        }
      },
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lastName = newValue,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
        }
        return '';
      },
      decoration: InputDecoration(
        labelText: 'Last Name',
        hintText: 'Enter your Last Name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(16)),
          child: const Icon(Icons.account_circle_outlined),
        ),
      ),
    );
  }

  TextFormField firstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        }
      },
      onSaved: (newValue) => firstName = newValue,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
        }
        return '';
      },
      decoration: InputDecoration(
        labelText: 'User Name',
        hintText: 'Enter your name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(16)),
          child: const Icon(Icons.account_circle_outlined),
        ),
      ),
    );
  }
}
