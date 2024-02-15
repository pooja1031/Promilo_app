import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:proilo_app/widgets/main_pages/main_page.dart';
import 'package:proilo_app/widgets/icon/icons.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('promilo'),
      
        
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.only(left:16.0,right: 16,top:60),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
           
            const Text("Hi, Welcome Back",style: TextStyle(color: Color.fromARGB(255, 5, 8, 58),fontWeight: FontWeight.w800,fontSize: 24),),
            const SizedBox(height: 30,),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text("Please Sign in to continue",style: TextStyle(color:Color.fromARGB(255, 44, 26, 138),fontWeight: FontWeight.w500),)),
                    _buildTextField(
                      
                controller: emailController,
                labelText: 'Email ID',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
               const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text("Password",style: TextStyle(color:Color.fromARGB(255, 44, 26, 138),fontWeight: FontWeight.w500),)),
              _buildTextField(
                controller: passwordController,
                labelText: 'Password',
                obscureText: true,
              ),
          
             // SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      _onRememberMeChanged(value);
                    },
                  ),
                  const Text('Remember Me'),
                 const  Spacer(),
                  TextButton(
                    onPressed: () {
                      _navigateToForgotPassword(context);
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
          
          
              ElevatedButton(
                onPressed: () async {
                  _validateAndLogin(context);
                },
                style: ElevatedButton.styleFrom(
          
                      fixedSize: const Size(600, 60), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), 
              ),
              side: const BorderSide(color: Color.fromARGB(233, 74, 87, 230,),width: 3), 
          backgroundColor: const Color.fromARGB(255, 123, 164, 198), 
            ),
                child: const Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              const SizedBox(height: 30,),
              const Text("Or"),
                     const     SizedBox(height: 30,),
          
              Row(
              children: [
            SizedBox(width: 110,),
              SquareTile(imagePath: 'assets/google_icon.jpg'),
              SizedBox(width: 15,),
              SquareTile(imagePath: 'assets/linkedin_icon.png'),
              SizedBox(width: 15,),
              SquareTile(imagePath: 'assets/facebook_icon.png'),
              SizedBox(width: 15,),
              SquareTile(imagePath: 'assets/instagram_icon.png',),
              SizedBox(width: 15,),
              SquareTile(imagePath: 'assets/watsapp_icon.png',),
              ],),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Bussiness User?"),
                Text("Don't have an account"),
              ],),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Login Here",style: TextStyle(color:Color.fromARGB(255, 19, 74, 162) ,fontWeight: FontWeight.w600),),
                  Text("Sign Up Here",style: TextStyle(color:Color.fromARGB(255, 19, 74, 162) ,fontWeight: FontWeight.w600),)
              ],),
              const Text("By continuing you agree to promilos",style: TextStyle(color:Colors.grey),),
               const Text.rich(
              TextSpan(
                text: 'promilos',
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                    text: ' Terms Of Use & Privacy Policy',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),

const Divider(
  thickness: 5,
  indent:150,
  endIndent:150
)

            ],
          ),
        ),
      ),
    );
  }



 Widget _buildTextField({
  required TextEditingController controller,
  required String labelText,
  TextInputType? keyboardType,
  bool obscureText = false,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: InputBorder.none, 
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    ),
  );
}


  void _validateAndLogin(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    if (_isValidEmail(email) && _isValidPassword(password)) {
      bool loginSuccess = await _callLoginAPI(context, email, password);
      if (loginSuccess) {
        // ignore: use_build_context_synchronously
        _navigateToSuccessfulScreen(context);
      }
    } else {
      _showValidationErrorMessage(context);
    }
  }
  bool _isValidEmail(String email) {
    return email.isNotEmpty && email.contains('@');
  }
  bool _isValidPassword(String password) {
    return password.isNotEmpty;
  }



  Future<bool> _callLoginAPI(
      BuildContext context, String email, String password) async {
    // ignore: prefer_const_declarations
    final String apiUrl = 'https://apiv2stg.promilo.com/user/oauth/token';
    // ignore: prefer_const_declarations
    final String basicAuth = 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==';
    String sha256Password = _sha256(password);
    var formData = http.MultipartRequest('POST', Uri.parse(apiUrl));
    formData.headers.addAll({
      'Authorization': basicAuth,
    });
    formData.fields.addAll({
      'username': email,
      'password': sha256Password,
      'grant_type': 'password',
    });
    try {
      final http.Response response = await http.Response.fromStream(
        await formData.send(),
      );
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print('Login successful');
        return true;
      } else {
        // ignore: avoid_print
        print('Login failed: ${response.statusCode} - ${response.body}');
        // ignore: use_build_context_synchronously
        _showErrorSnackbar(context, 'Invalid ID or Password');
        return false;
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error during API call: $error');
      // ignore: use_build_context_synchronously
      _showErrorSnackbar(context, 'An error occurred. Please try again later.');
      return false;
    }
  }

  String _sha256(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }




  void _navigateToSuccessfulScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenMain(),
      ),
    );
  }





  void _showValidationErrorMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      // ignore: prefer_const_constructors
      SnackBar(
        content: const Text('Invalid email or password format'),
      ),
    );
  }




  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
   void _onRememberMeChanged(bool? value) {
    rememberMe = value ?? false;
  }



  void _navigateToForgotPassword(BuildContext context) {
    
    // ignore: avoid_print
    print('Forgot Password clicked');
  }
}





