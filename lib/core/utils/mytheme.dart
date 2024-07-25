import 'package:flutter/material.dart';
import 'package:random_user/core/utils/mycolor.dart';

class Mythemewhite{ 
  var appthemewhite=ThemeData( 
    scaffoldBackgroundColor: Mycolor_white().scaffoldcolor,
    //---------------------------->
    sliderTheme: SliderThemeData( 
      thumbColor: Mycolor_white().scaffoldcolor,
      activeTrackColor: Mycolor_white().slidercolor,
      inactiveTrackColor: Mycolor_white().scaffoldcolor,
    ),
    iconTheme: IconThemeData(size: 30,color: Mycolor_white().primarycolor),
    //------------------------->
    textTheme: TextTheme( 
      headlineMedium: TextStyle( 
        fontSize: 20,
         
        color: Mycolor_white().primarycolor 
      ),
      headlineLarge: TextStyle( 
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Mycolor_white().primarycolor 
      )
    ),
    //----------->
 
    //-------->
    switchTheme: SwitchThemeData( 
      thumbColor: MaterialStateProperty.all(Mycolor_white().slidercolor),
      trackColor: MaterialStateProperty.all(Mycolor_white().primarycolor)
    ),
    //------------>
    appBarTheme: AppBarTheme(backgroundColor: Mycolor_white().scaffoldcolor,
    iconTheme: IconThemeData(color: Mycolor_white().primarycolor,
    size: 40),),
    drawerTheme: DrawerThemeData(
      
   backgroundColor: Mycolor_white().scaffoldcolor,
  
   
    ),
    //---------------------------->
    dialogTheme: DialogTheme(backgroundColor: Mycolor_black().slidercolor),

    //------------------------------->
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Mycolor_white().primarycolor)
  );
}
 

//----------------------------------------------------------------------------->
class Mythemedark{ 
  var apptheme_dark=ThemeData( 
    scaffoldBackgroundColor: Mycolor_black().scaffoldcolor,
    //------------------------->
    sliderTheme: SliderThemeData( 
      thumbColor: Mycolor_black().scaffoldcolor,
      activeTrackColor: Mycolor_black().slidercolor,
      inactiveTrackColor: Mycolor_black().scaffoldcolor,
    ),
    //------------------------->
    drawerTheme: DrawerThemeData(
     
      backgroundColor: Mycolor_black().scaffoldcolor
   
    ),
    //------------------------->
 
    iconTheme: IconThemeData(size: 30,color: Mycolor_black().primarycolor),
   textTheme: TextTheme( 
    headlineMedium: TextStyle( 
        fontSize: 20,
     
        color: Mycolor_black().primarycolor
      ),
      headlineLarge: TextStyle( 
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Mycolor_black().primarycolor
      )
    ),
    //------------------------>
    dialogTheme: DialogTheme(backgroundColor: Mycolor_black().slidercolor),
    //------------------------->

    appBarTheme: AppBarTheme(backgroundColor: Mycolor_black().scaffoldcolor,
    iconTheme: IconThemeData(color: Mycolor_black().primarycolor,size: 40)),
      switchTheme: SwitchThemeData( 
      thumbColor: MaterialStateProperty.all(Mycolor_black().slidercolor),
      trackColor: MaterialStateProperty.all(Mycolor_black().primarycolor)
    ),
    //------------------------->
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Mycolor_black().primarycolor)

       
  );
}