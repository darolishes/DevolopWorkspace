import 'dart:async';

import 'package:devolop/data/local/datasources/post/post_datasource.dart';
import 'package:devolop/data/network/apis/posts/post_api.dart';
import 'package:devolop/data/repository/post/post_repository_impl.dart';
import 'package:devolop/data/repository/setting/setting_repository_impl.dart';
import 'package:devolop/data/repository/user/user_repository_impl.dart';
import 'package:devolop/data/sharedpref/shared_preference_helper.dart';
import 'package:devolop/domain/repository/post/post_repository.dart';
import 'package:devolop/domain/repository/setting/setting_repository.dart';
import 'package:devolop/domain/repository/user/user_repository.dart';

import '../../../di/service_locator.dart';

mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------
    getIt.registerSingleton<SettingRepository>(SettingRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
    ));

    getIt.registerSingleton<UserRepository>(UserRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
    ));

    getIt.registerSingleton<PostRepository>(PostRepositoryImpl(
      getIt<PostApi>(),
      getIt<PostDataSource>(),
    ));
  }
}
