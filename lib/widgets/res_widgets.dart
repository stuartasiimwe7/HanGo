import 'package:flutter/material.dart';


//Reusable Text Field
TextField resTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: isPasswordType,
      autocorrect: isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
      ),
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          labelText: text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.lightBlue,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress);
}

//Reusable Button
Container signInSignUpButton(BuildContext context, bool isLogin, Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height:50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: Padding(
      padding: const EdgeInsets.only(left:15.0, right: 15.0),
      child: ElevatedButton(
        onPressed:(){
          onTap();
          //What happens when you press the button
        },
    
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states){
                if (states.contains(MaterialState.pressed)){
                  return Colors.black26;
              }
              return Colors.lightBlue;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              ), 
        child: Text(
          isLogin ? 'LOG IN' : 'Sign Up',
          style: const TextStyle(
            color: Colors.white, fontWeight:FontWeight.bold, fontSize:16
            ),
            )
              ),
    )
          );
}