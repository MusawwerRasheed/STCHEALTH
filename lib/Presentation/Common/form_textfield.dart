  import 'package:flutter/material.dart';

  class CustomTextField extends StatelessWidget {
    final String? hintText;
    final bool? obscure;
    final String? label;
    final Widget? suffix;
    final Widget? prefix;
    final TextEditingController? inputcontroller;
    final FocusNode? inputfocusnode;



    const CustomTextField({
      Key? key,
      this.inputfocusnode, 
      this.inputcontroller,
      this.obscure,
      this.prefix, 
      this.hintText,
      this.label,
      this.suffix,
    }) : super(key: key);

  

    @override
    Widget build(BuildContext context) {
      return TextField( 
        focusNode: inputfocusnode,       
        controller: inputcontroller,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          suffix: suffix, 
          
          prefix: prefix, 
        ),
      );
    }    
  }
  