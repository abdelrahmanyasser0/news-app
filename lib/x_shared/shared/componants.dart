import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';


//بتاع news app
Widget BuildArticalItem(article,context)=>Padding(

  padding: const EdgeInsets.all(15),

  child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    mainAxisAlignment: MainAxisAlignment.start,

    children: [

      Row(

        children: [

          Container(

            height: 120,

            width: 100,

            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(12),

                image:  DecorationImage(image: NetworkImage('${article['urlToImage']}',

                ),fit: BoxFit.cover)

            ),

          ),

          const SizedBox(

            width: 15,

          ),

          Expanded(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(

                  '${article['title']} ',

                  style: Theme.of(context).textTheme.bodyText2,

                  maxLines: 2,

                  overflow: TextOverflow.ellipsis,

                ),

                const SizedBox(height: 6,),

                Text('${article['publishedAt']}',style: Theme.of(context).textTheme.labelMedium,),

              ],

            ),

          )

        ],

      )

    ],

  ),

);



//فورم فيلد
Widget defaultTextForm({
  FormFieldValidator? function,
  required TextEditingController controller,
  Icon? prefIcon,
  required String label,
  required OutlineInputBorder border,
  required TextInputType inputType,
  Icon? suffIcon,
})=> TextFormField(
    controller: controller,
    validator: function,
    keyboardType: inputType,
    decoration:  InputDecoration(
        border: border,
        labelText: label,
        prefixIcon: prefIcon,
      suffixIcon: suffIcon,
    ),

  );




//تغيير التوست
Future<bool?> showToast({
  required String text,
  required ToastStates state,

})=> Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor:selectedToastColor(state) ,
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates {SUCCESS,ERROR,WARNIMG}

Color selectedToastColor(ToastStates state){
   Color color;
  switch(state){
    case  ToastStates.SUCCESS:
    color = Colors.green;
    break;
    case ToastStates.ERROR:
    color = Colors.red ;
    break;
    case  ToastStates.WARNIMG:
    color = Colors.amberAccent ;
    break;
  }
  return color;

}



void navigatorAndFinish({required BuildContext context ,required widget})=>
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>widget), (route) => false);

void navigatorPush({required BuildContext context ,required widget})=>
    Navigator.push(context,MaterialPageRoute(builder: (context)=>widget));

Widget buildListProduct( model,context,{bool oldPrice=true})=> Padding(
  padding: const EdgeInsets.all(20),
  child: Container(
    height: 120,
    child: Row(
      children: [
        Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image:NetworkImage(
                  model.image!,
                ),
                width:120,
                height: 120,
              ),
              if(model.discount!=0&&oldPrice)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: const Text(
                    'Discount',
                    style: TextStyle(
                      fontSize:15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                )
            ]
        ),
        const SizedBox(
          width: 20,
        ),

      ],
    ),
  ),
);