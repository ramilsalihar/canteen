import 'package:auto_route/auto_route.dart';
import 'package:canteen/core/extensions/context_extension.dart';
import 'package:canteen/core/routes/app_router.gr.dart';
import 'package:canteen/data/models/user_model.dart';
import 'package:canteen/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:canteen/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  dynamic user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        user = UserModel(
          id: 'id',
          name: 'Ramil',
          surname: 'Salihar',
          email: 'ramil.salihar_ucentralasia.org',
          userType: 'userType',
          phoneNumber: 'phoneNumber',
          balance: 0,
          purchases: [],
        );
        // if (state is AuthUserSuccessState) {
        //   user = state.user;
        // } else if (state is AuthAdminSuccessState) {
        //   user = state.user;
        // }
        return Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(context.dimens.borderRadius),
              bottomRight: Radius.circular(context.dimens.borderRadius),
            ),
          ),
          child: Column(
            children: [
              _buildHeader(context, user),
              TextButton(
                onPressed: () {
                  context.replaceRoute(ProfileRoute(user: user));
                },
                child: const Text('Personal Details'),
              ),
              TextButton(
                onPressed: () {
                  print('Home');
                },
                child: const Text('Settings'),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
                child: AppButton(
                  title: 'Logout',
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      LogoutButtonPressed(),
                    );
                    context.replaceRoute(const AuthRoute());
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Widget _buildHeader(BuildContext context, dynamic user) {
  final theme = Theme.of(context);
  return SizedBox(
    height: 240,
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(context.dimens.borderRadius),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Text(
                user.name[0],
                style: theme.textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              '${user.name} ${user.surname}',
              style: theme.textTheme.displayLarge!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user.email,
              style: theme.textTheme.displaySmall!.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
