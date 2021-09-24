import 'package:flutter/material.dart';

void navigateTo(context,widget)=>Navigator.push
  (
  context,
  MaterialPageRoute(
      builder: (context)=>widget),
);


void navigateAndFinish(context, widget)=> Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context)=>widget
        ),
            (Route<dynamic>route) => false,
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChang,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool readonly=false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChang,
      readOnly: readonly,
      onTap: onTap,
      validator: validate,

      decoration: InputDecoration(
        labelText: label,

        prefixIcon: Icon(prefix),

        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed(),
          icon: Icon(suffix),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaulteButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 10.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(onPressed:function,child: Text(text),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );


Widget defaultTextButton({
  @required Function function,
  @required String text,
})=>TextButton(
  onPressed: function,
  child:Text(text.toUpperCase(),),
);