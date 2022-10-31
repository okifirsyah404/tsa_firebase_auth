import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/typography_theme.dart';

class RegularTextField extends StatefulWidget {
  const RegularTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.suffixIcon,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final Widget suffixIcon;
  final TextInputType? keyboardType;

  @override
  State<RegularTextField> createState() => _RegularTextFieldState();
}

class _RegularTextFieldState extends State<RegularTextField>
    with SingleTickerProviderStateMixin {
  FocusNode focusNode = FocusNode();
  bool hasFocus = false;
  late AnimationController animationController;
  late Animation<double> animationTween;

  @override
  void initState() {
    focusNode.addListener(() {
      print(focusNode.hasFocus);
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    animationTween =
        Tween<double>(begin: 0, end: 5).animate(animationController);
    animationController.addListener(
      () {
        setState(() {});
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onFocusChange: (value) {
        if (value) {
          animationController.forward();
        } else {
          animationController.reverse();
        }
        setState(() {
          hasFocus = !hasFocus;
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: animationTween.value,
        child: Container(
          decoration: BoxDecoration(
            color: ColorsTheme.neutralColor[50],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: SizedBox(
              height: 64,
              child: Center(
                child: TextField(
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  style: TypographyTheme.bodyRegular.copyWith(
                    color: ColorsTheme.neutralColor[900],
                  ),
                  decoration: InputDecoration(
                    icon: SizedBox(
                      height: 32,
                      width: 32,
                      child: Center(
                        child: widget.suffixIcon,
                      ),
                    ),
                    border: InputBorder.none,
                    labelText: !widget.controller.text.isEmpty
                        ? hasFocus
                            ? widget.label
                            : null
                        : widget.label,
                    labelStyle: hasFocus
                        ? TypographyTheme.bodySmall
                            .copyWith(color: ColorsTheme.neutralColor[600])
                        : TypographyTheme.bodyRegular
                            .copyWith(color: ColorsTheme.neutralColor[900]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
