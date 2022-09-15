import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  final Function(String? txt)? changeFx;
  final Function(String? txt)? submitFx;
  final Function()? resetFx;
  final TextEditingController? fieldController;
  final String? hint;
  final bool? isSearching;
  final FocusNode? node;

  // ignore: use_key_in_widget_constructors
  const SearchField(
      {this.changeFx,
      this.submitFx,
      this.resetFx,
      this.fieldController,
      this.hint,
      this.isSearching = false,
      this.node});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.w),
        child: TextFormField(
            focusNode: node,
            controller: fieldController,
            onChanged: changeFx,
            onFieldSubmitted: submitFx,
            keyboardType: TextInputType.text,
            enabled: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
                hintText: hint,
                hintStyle:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                suffixIconColor: Theme.of(context).splashColor,
                prefixIcon: const Icon(
                  Icons.search_sharp,
                ),
                suffixIcon: isSearching!
                    ? IconButton(
                        onPressed: resetFx,
                        icon: Icon(
                          Icons.cancel,
                          color: Theme.of(context).splashColor,
                        ))
                    : null,
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.r),
                  ),
                  borderSide: BorderSide(
                    width: 1.w,
                    style: BorderStyle.solid,
                  ),
                ))));
  }
}
