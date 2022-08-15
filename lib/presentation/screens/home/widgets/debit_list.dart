import 'package:debitapp_bloc/business_logic/bloc/api_bloc.dart';
import 'package:debitapp_bloc/data/repository/data_repo.dart';
import 'package:debitapp_bloc/presentation/screens/home/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DebitListWidget extends StatelessWidget {
  const DebitListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApiBloc>(
      create: (context) => ApiBloc(RepositoryProvider.of<DataRepo>(context))
        ..add(LoadApiEvent()),
      child: Container(
        height: 600.h,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 240, 238, 238),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26), topRight: Radius.circular(26))),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 86),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Debits",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      ))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: RefreshIndicator(onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                }, child: BlocBuilder<ApiBloc, ApiState>(
                  builder: (context, state) {
                    if (state is ApiErrorState) {
                      return Text(state.errorMessage);
                    } else if (state is ApiSuccessState) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return CustomListTile(
                              data: state.data[index], index: index);
                        },
                        itemCount: state.data.length,
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
