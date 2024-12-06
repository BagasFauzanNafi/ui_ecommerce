import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/my_default_button.dart';
import '../../size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    super.key,
  });

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> otp = List.filled(4, null);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              otp.length,
              (index) => OtpField(index: index, otp: otp),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          MyDefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }

                if (otp.isNotEmpty) {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
              })
        ],
      ),
    );
  }
}

class OtpField extends StatefulWidget {
  final int index;
  final List<String?> otp;

  const OtpField({
    super.key,
    required this.index,
    required this.otp,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      if (_controller.text.isEmpty && widget.index > 0) {
        FocusScope.of(context).previousFocus();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(60),
      child: TextFormField(
        controller: _controller,
        onSaved: (newValue) =>
            setState(() => widget.otp[widget.index] = newValue),
        onChanged: (newValue) {
          if (newValue.length == 1) {
            if (widget.index == widget.otp.length - 1) {
              FocusScope.of(context).unfocus();
            } else if (newValue.isEmpty && widget.index == 0) {
              FocusScope.of(context).requestFocus();
            } else {
              FocusScope.of(context).nextFocus();
            }
          }
        },
        onFieldSubmitted: (value) {
          if (value.isEmpty && widget.index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (context,
                {required currentLength,
                required isFocused,
                required maxLength}) =>
            null,
        style: const TextStyle(fontSize: 24),
        decoration: otpDecoration,
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
