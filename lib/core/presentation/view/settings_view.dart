import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../feature/feature.dart';
import '../../core.dart';


class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
    required this.authBloc,
  });
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.titleMedium!.copyWith(fontSize: 16.sp);
    final UserProfile user = authBloc.state.user;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppHeight.h50.h,
        title: Text('settings', style: titleStyle),
        centerTitle: true,
        leading: const CustomBackButton(),
        backgroundColor: AppColors.backgroundSecondary,
      ),
      body: ListView(
        children: [
          SizedBox(height: AppHeight.h24.h),
          _accountSettings(user, context),
          SizedBox(height: AppHeight.h24.h),
          _settingsList(context),
        ],
      ),
    );
  }

  Container _accountSettings(UserProfile user, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: AppColors.backgroundPrimary,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSize.s24.r,
            backgroundColor: AppColors.primary.withOpacity(0.1),
            child: Text(
              user.username ?? '' [0].toUpperCase(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(width: AppWidth.w20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.username!, style: textTheme.titleMedium),
              Text(user.email!, style: textTheme.titleSmall),
            ],
          ),
        ],
      ),
    );
  }

  Container _settingsList(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      child: Column(
        children: [
          SettingItem(
            label: 'Notifications',
            icon: Icons.notifications_outlined,
            onTap: () {},
          ),
          SettingItem(
            label: 'Logout',
            icon: Icons.logout_outlined,
            onTap: () => authBloc.add(AuthLogoutRequested()),
            color: Colors.red,
            isLast: true,
          ),
        ],
      ),
    );
  }
}
