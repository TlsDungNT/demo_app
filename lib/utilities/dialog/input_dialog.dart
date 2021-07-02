import 'package:demo_app/widgets/button.dart';
import 'package:demo_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

import 'dialog_manager.dart';

void showInputDialog({required BuildContext context,
  String? title,
  required String message,
  required Function onConfirm,
  Function? onCancel,
  required TextEditingController inputValue}) {
  DialogManager.show(
    context: context,
    builder: (context) {
      return _SystemPadding(
        child: _Dialog(
          inputValue: inputValue,
          title: title,
          message: message,
          onConfirm: onConfirm,
          onCancel: onCancel,
        ),
      );
    },
  );
}

class _Dialog  extends StatelessWidget {
  final String? title;
  final String message;
  final Function onConfirm;
  final Function? onCancel;
  final TextEditingController? inputValue;

  const _Dialog(
      {Key? key, this.title, required this.message, required this.onConfirm, this.onCancel, this.inputValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title ?? 'Nhập thông tin',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                message,
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
              ),
              const SizedBox(
                height: 16,
              ),
              myTextField(
                  keyboradType: TextInputType.text,
                  maxLengthInput: 50,
                  textCapitalization: TextCapitalization.words,
                  hintText: "Nhập nội dung",
                  controller: inputValue),
              Row(
                children: [
                  Expanded(
                    child: XeButton(
                      onPressed: () {
                        if (onCancel != null) {
                          onCancel!();
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      text: 'Huỷ',
                      otherStyle: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: XeButton(
                      onPressed: () {
                        onConfirm();
                        Navigator.of(context).pop();
                      },
                      text: 'Đồng ý',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
