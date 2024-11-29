import 'package:fruit_hub/core/services/fire_base_auth_services.dart';
import 'package:fruit_hub/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fruit_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIT = GetIt.instance;

void setUpGetIt() {
  getIT.registerSingleton<FireBaseAuthServices>(FireBaseAuthServices());
  getIT.registerSingleton<AuthRepo>(AuthRepoImpl(
    fireBaseAuthServices: getIT.get<FireBaseAuthServices>(),
  ));

  getIT.registerSingleton<SignupCubit>(SignupCubit(getIT.get<AuthRepo>()));
}
