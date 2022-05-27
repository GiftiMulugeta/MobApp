import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget{
  App({Key?key}):super(key:key);
  @override
  Widget build(BuildContext) =>MaterialApp.router(
    routeInformationParser: _router.routeInformationParser,
    routerDelegate: _router.routerDelegate,
    title:'Go router Example'
  );
  final _router=GoRouter(
    routes:[
      GoRoute(path:'/',
      builder:(context,state)=> LoginPage()),
      GoRoute(
        path:'/mainscreen',
        builder:(context,state)=> MainScreen()
      ),
      GoRoute(path:'/profiles',
      builder:(context,state)=> Profiles()),
      GoRoute(path:'/notificaion',
      builder:(context,state)=> Notification()),
      GoRoute(path:'/attendance',
      builder:(context,state)=> Request()),
      GoRoute(path:'/request',
      builder:(context,state)=> Attendance()),
        ]
  );
  }
  class LoginPage extends StatelessWidget{
    @override
  Widget build(BuildContext context){
    return Scaffold(appBar:AppBar(title: Text("")),
    body:ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index){
      //final list=lists[index];
      return Center(child:
      Positioned(
        top:50,
        child:
      Container(
        width:250,
        height: 250,
        child:
      Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children:[
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child:
           TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Username',
            ),
          ),
      ),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child:
           TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Password',
            ),
          ),
      ),
    OutlinedButton(onPressed: ()=>context.go('/mainscreen'), child: Text("Login"))    
      ]
      ),
      )),
      ); 
    }
    ),
    );
  }
}

class MainScreen extends StatelessWidget{
  MainScreen({Key?key}):super(key:key);
 
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text("")),
    body: Container(color:Colors.blue[50],child: Stack(  
              children:[
                Positioned(
                  child:          InkWell(
    onTap: () =>context.go('/profiles'),
    child: Container(child:Text("Profiles"),color: Colors.green[100],),
),),
Positioned(child:                
InkWell(
    onTap: () =>context.go('/attendance'),
    child: Container(child:Text("Attendance"),color: Colors.green[200],),
),),
Positioned(child:
InkWell(
    onTap: () =>context.go('/request'),
    child: Container(child:Text("Request"),color: Colors.green[300],),
),),
Positioned(child:
Container(child:InkWell(
    onTap: () =>context.go('/notification'),
    child: Container(child:Text("Notifiation"),color: Colors.green[400],),
))
)




        ]

        ))
        );
        }
   
    
  }

class Attendance extends StatelessWidget{
  Attendance({Key?key}):super(key:key);
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar:AppBar(title:Text("hi"))
    );
  }
}
class Profiles extends StatelessWidget{
  Profiles({Key?key}):super(key:key);
  @override 
  Widget build(BuildContext context){
    return Scaffold(appBar:AppBar(title:Text("hey")));

  }

}
class Notification extends StatelessWidget{
  Notification({Key?key}):super(key:key);
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar:AppBar(title:Text("hui")));
  }
}
class Request extends StatelessWidget{
  Request({Key?key}):super(key:key);
@override
Widget build(BuildContext context){
return Scaffold(appBar:AppBar(title:Text("Request age")),
body:
Positioned(child:Container(
  child:Column(children: [
    Row(children: [
      Text("To:"),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child:
           TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              //labelText: 'Username',
            ),
          ),
      ),
    ],),
    const TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    //hintText: 'Enter a search term',
  ),
)
    
    
  ],))
));
}
}





// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);
//   final formKey = GlobalKey<FormState>();
//   final emailCtrl = TextEditingController();
//   final passCtrl = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: emailCtrl,
//                 decoration: InputDecoration(
//                   hintText: "Email",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (String? email) {
//                   if (email == null || email.isEmpty) {
//                     return "Email must not be empty";
//                   }

//                   final emailTest = RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
//                   final emailValid = emailTest.hasMatch(email);
//                   return emailValid ? null : "Email not valid";
//                 },
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: passCtrl,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (String? password) {
//                   if (password == null || password.isEmpty) {
//                     return "Password must not be empty";
//                   }

//                   return password.length >= 8 ? null : "Password too short";
//                 },
//               ),
//               SizedBox(height: 10),
//               BlocConsumer<AuthBloc, AuthState>(
//                 listenWhen: (_, current) {
//                   return current is LoginSuccessful;
//                 },
//                 listener: (_, AuthState state) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => HomeScreen()),
//                   );
//                 },
//                 // buildWhen: (previous, current) {
//                 //   return previous is Idle ||
//                 //       current is Idle ||
//                 //       current is LogingIn;
//                 // },
//                 builder: (_, AuthState state) {
//                   Widget buttonChild = Text("Log in");
//                   if (state is LogingIn) {
//                     buttonChild = const SizedBox(
//                       width: 20,
//                       height: 20,
//                       child: CircularProgressIndicator(
//                         color: Colors.white,
//                       ),
//                     );
//                   }

//                   if (state is LoginSuccessful) {
//                     buttonChild = const Text("Login successful");
//                   }

//                   if (state is LoginFailed) {
//                     buttonChild = const Text("Login failed");
//                   }

//                   return ElevatedButton(
//                     onPressed: state is LogingIn
//                         ? null
//                         : () {
//                             final formValid = formKey.currentState!.validate();
//                             if (!formValid) return;

//                             final authBloc = BlocProvider.of<AuthBloc>(context);
//                             authBloc.add(Login(emailCtrl.text, passCtrl.text));
//                           },
//                     child: buttonChild,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }