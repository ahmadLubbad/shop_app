import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/modules/shop_app/register/register_screen.dart';
import 'package:shop_app/shared/componentes.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var emailController=TextEditingController();
    var passwordController=TextEditingController();


    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LOGIN',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'login now to browse our hot offers',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),

            defaultFormField(
                controller: emailController,
                type: TextInputType.emailAddress,
                validate: (String value){
                  if(value.isEmpty){
                    return 'Please enter your email address';
                  }
                },
                label: 'Email Address',
                prefix: Icons.email_outlined,
            ),
            SizedBox(
              height: 15.0,
            ),

            defaultFormField(
              controller: passwordController,
              type: TextInputType.visiblePassword,
              suffix: Icons.visibility_outlined,
              suffixPressed: (){},
              validate: (String value){
                if(value.isEmpty){
                  return 'Please enter your password';
                }
              },
              label: 'Password',
              prefix: Icons.lock_outlined,
            ),

            SizedBox(
              height: 15.0,
            ),

            defaulteButton(
                function: (){},
                text: 'Login',
              isUpperCase: true,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                      'Do Not Have An Account',
                  ),
                ),
                defaultTextButton(
                    function:(){
                      navigateTo(
                        context, RegisterScreen());
                    },
                    text: 'Register',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
