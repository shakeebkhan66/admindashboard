import 'package:admindashboardflutter/Layout/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../Constants/constant.dart';


List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];
int _currentSelectedButton = 0;

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10)
              ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30,
                child: Image.asset("assets/images/1.png"),
              ),
            ) else
              IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 30,
                color: Colors.white,
                icon: const Icon(Icons.menu),
              ),
          const SizedBox(width: Constants.kPadding,),
          const Spacer(),
          if(ResponsiveLayout.isComputer(context))
            ...List.generate(_buttonNames.length, (index) => TextButton(
            onPressed: (){
              setState(() {
                _currentSelectedButton = index;
              });
            },
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _buttonNames[index],
                        style: TextStyle(
                          color: _currentSelectedButton == index ? Colors.white : Colors.white70
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(Constants.kPadding / 2),
                        width: 60,
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: _currentSelectedButton == index ? const LinearGradient(
                            colors: [
                              Constants.red,
                              Constants.orange,
                            ]
                          ) : null,
                        )
                      )
                    ],
                  ),
                ),
            ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: const TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.all(Constants.kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Constants.red,
                          Constants.orange,
                        ]
                      )
                    ),
                  )
                ],
              ),
            ),
          const Spacer(),
          IconButton(
            iconSize: 30,
          onPressed: (){},
          icon: const Icon(Icons.search, color: Colors.white,),
          ),
          Stack(
            children: [
              IconButton(
                iconSize: 30,
                onPressed: (){},
                icon: const Icon(Icons.notifications_none_outlined, color: Colors.white,),
              ),
              const Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 8,
                  child: Text("4", style: TextStyle(fontSize: 10, color: Colors.white),),
                ),
              )
            ],
          ),
          if(!ResponsiveLayout.isPhone(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  )
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Constants.orange,
                radius: 30,
                child: Image.asset("assets/images/2.png", height: 80,),
              ),
            )
        ],
      ),
    );
  }
}
