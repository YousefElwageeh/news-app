import 'package:flutter/material.dart';
import 'package:news_app/screens/pages/web_view.dart';

Widget bulidatrical(artical, context) {
  return InkWell(
    onTap: () {
      navigateTo(
          context,
          WebScreen(
            artical['url'],
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(artical['urlToImage'] = artical[
                        'urlToImage'] ??
                    'https://th.bing.com/th/id/OIP.-4pOBgj3M4bHaNnaB3iTCAHaFj?pid=ImgDet&rs=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  artical['title'],
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(artical['publishedAt'],
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ]),
      ),
    ),
  );
}

Widget mydivder() => Container(
      height: 1,
      color: Colors.grey,
    );

Widget defaultFormField2({
  required TextEditingController controller,
  required String label,
  required IconData prefix,
  var ontap,
  var type,
  var suffix,
  var function,
  var validator,
  bool isPassword = false,
  var oncahnge,
}) =>
    TextFormField(
      validator: validator,
      onTap: ontap,
      onChanged: oncahnge,
      obscureText: isPassword,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: function,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget bulidScreenNews(items, context, {bool Search = false}) {
  if (items.isEmpty) {
    if (Search) {
      return Container();
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.deepOrange,
        ),
      );
    }
  } else {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => bulidatrical(items[index], context),
      separatorBuilder: (context, index) => mydivder(),
      itemCount: items.length,
    );
  }
}

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required void Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
