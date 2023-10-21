
import 'package:flutter/material.dart';

import '../color/color_code.dart';

class CustomMessage{

  showSuccessMessage({
    required BuildContext context,
    Key? key,
    //
    required String text,
    String subText="",
    required MessageTypeSelect type,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    double? actionOverflowThreshold,
    bool? showCloseIcon,
    Color? closeIconColor,
    void Function()? onVisible,
    DismissDirection dismissDirection = DismissDirection.down,
    Clip clipBehavior = Clip.hardEdge,
  }){
    MessageColor type1=findtype(type);
    final snackBar = SnackBar(
        key:key,
        content:ListTile(
          leading: Icon(type1.icon,color: type1.text_color,),
          title: Text(text,style: TextStyle(color:type1.text_color,fontWeight: FontWeight.w700),),
          subtitle: Text(subText,style: TextStyle(color:type1.text_color ),),
        ),
        backgroundColor:type1.bg_color,
        elevation:0,
        margin:margin??EdgeInsets.symmetric(vertical: 0,horizontal: 0),
        padding:padding,
        width:width,
        shape:shape,
        behavior:behavior,
        actionOverflowThreshold:actionOverflowThreshold,
        showCloseIcon:showCloseIcon,
        closeIconColor:closeIconColor,
        onVisible:onVisible,
        dismissDirection: dismissDirection,
        clipBehavior:clipBehavior,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  }

  MessageColor findtype(MessageTypeSelect type) {
    switch(type){
      case MessageTypeSelect.simple:
        return MessageType().simple;
      case MessageTypeSelect.success:
        return MessageType().success;
      case MessageTypeSelect.warning:
        return MessageType().warning;
      case MessageTypeSelect.error:
        return MessageType().error;
      default :
        return MessageType().simple;
    }
  }
}

enum MessageTypeSelect{
  simple,
  success,
  error,
  warning,
}

class MessageType{
  MessageColor simple=MessageColor(bg_color: selectedColor, text_color: selectedTextColor, icon: Icons.info);
  MessageColor success=MessageColor(bg_color: successColor, text_color: successTextColor, icon: Icons.done);
  MessageColor error=MessageColor(bg_color: errorColor, text_color: errorTextColor, icon: Icons.error);
  MessageColor warning=MessageColor(bg_color: warningColor, text_color: warningTextColor, icon: Icons.warning);
}

class MessageColor{
  Color? bg_color;
  Color? text_color;
  IconData? icon;

  MessageColor({required this.bg_color,required this.text_color,required this.icon});
}
