import 'package:debitapp_bloc/data/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);
  final Datum data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: ListTile(
          leading: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(data.img!))),
          ),
          title: Text(
            data.name!,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          ),
          subtitle: Text("Until ${data.until}"),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$ ${data.amount}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: index % 2 != 0 ? Colors.green : Colors.red),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "out of ${data.outOfAmount} ",
                style:
                    const TextStyle(color: Color.fromARGB(255, 136, 135, 135)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
