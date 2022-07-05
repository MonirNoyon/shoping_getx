import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/circular_reveal_clipper.dart';


class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -280,
            child: CircleAvatar(radius: 280,
            backgroundColor: Colors.black12,),
          ),
          Positioned(
            left: -50,
              top: -30,
              child: CircleAvatar(radius: 120,
              backgroundColor: Colors.black12,)
          ),
          Positioned(
            left: -90,
              top: -60,
              child: CircleAvatar(radius: 120,
              backgroundColor: Colors.black12,)
          ),
          Positioned(
            left: -120,
              top: -90,
              child: CircleAvatar(radius: 120,
              backgroundColor: Colors.black12,)
          ),
          Positioned(
            left: 12,
              top: 35,
              child: Text("Profile",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 22
              ),)
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: (){},
                                      icon: const Icon(Icons.settings)),
                                  IconButton(
                                      onPressed: (){},
                                      icon: const Icon(CupertinoIcons.pen)),
                                ],
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: -35,
                                child: CircleAvatar(
                                  radius: 35,
                                  child: Icon(CupertinoIcons.person,color: Colors.white,size: 35,),

                                ),
                              ),
                            ],
                          ),
                          const Text("Monir Hossain",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),),
                          const Text("monirpstu1@gmail.com",style: TextStyle(
                              color: Colors.grey
                          ),),
                          const Divider(
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 30,),
                          ListTile(
                            onTap: (){},
                            title: const Text("Notification",style: TextStyle(color: Colors.grey),),
                            leading: const Icon(CupertinoIcons.bell),
                            trailing: const Icon(CupertinoIcons.forward,color: Colors.grey,),
                          ),
                          ListTile(
                            onTap: (){},
                            title: const Text("Payment History",style: TextStyle(color: Colors.grey),),
                            leading: const Icon(CupertinoIcons.money_dollar),
                            trailing: const Icon(CupertinoIcons.forward,color: Colors.grey,),
                          ),
                          ListTile(
                            onTap: (){},
                            title: const Text("Invite Friends",style: TextStyle(color: Colors.grey),),
                            leading: const Icon(CupertinoIcons.person_2),
                            trailing: const Icon(CupertinoIcons.forward,color: Colors.grey,),
                          ),
                          ListTile(
                            onTap: (){},
                            title: const Text("About Us",style: TextStyle(color: Colors.grey),),
                            leading: const Icon(CupertinoIcons.clock),
                            trailing: const Icon(CupertinoIcons.forward,color: Colors.grey,),
                          ),
                          ListTile(
                            onTap: (){},
                            title: const Text("Log Out",style: TextStyle(color: Colors.grey),),
                            leading: const Icon(Icons.logout),
                            trailing: const Icon(CupertinoIcons.forward,color: Colors.grey,),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
