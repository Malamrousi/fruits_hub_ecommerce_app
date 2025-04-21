import 'package:fruit_hub/core/cubits/product/product_cubit.dart';
import 'package:fruit_hub/core/repo/product_repo/product_repo.dart';
import 'package:fruit_hub/core/repo/product_repo/product_repo_impl.dart';
import 'package:fruit_hub/core/services/data_base_services.dart';
import 'package:fruit_hub/core/services/fire_store_services.dart';
import 'package:fruit_hub/features/auth/data/data_source/fire_base_auth_data_source.dart';
import 'package:fruit_hub/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fruit_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item/cart_item_cubit.dart';
import 'package:fruit_hub/features/checkout/data/repo/orders_repo_impl.dart';
import 'package:fruit_hub/features/checkout/domain/repo/orders_repo.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/add_order_cubit/add_order_cubit.dart';
import 'package:get_it/get_it.dart';

final getIT = GetIt.instance;

void setUpGetIt() {
  getIT.registerSingleton<FireBaseAuthServices>(FireBaseAuthServices());
  getIT.registerLazySingleton<DatabaseService>(() => FireStoreService());
  getIT.registerSingleton<AuthRepo>(AuthRepoImpl(
    fireBaseAuthServices: getIT.get<FireBaseAuthServices>(),
    dataBaseServices: getIT.get<DatabaseService>(),
  ));

  getIT.registerSingleton<SignupCubit>(SignupCubit(getIT.get<AuthRepo>()));
  getIT.registerSingleton<LoginCubit>(LoginCubit(getIT.get<AuthRepo>()));
  getIT.registerSingleton<ProductsRepoImpl>(
      ProductsRepoImpl(getIT.get<DatabaseService>()));
  getIT.registerSingleton<ProductsRepo>(getIT.get<ProductsRepoImpl>());
  getIT.registerSingleton<ProductCubit>(
      ProductCubit(getIT.get<ProductsRepoImpl>()));

  getIT.registerFactory<CartCubit>(() => CartCubit());
  getIT.registerFactory<CartItemCubit>(() => CartItemCubit());
    getIT.registerLazySingleton<OrdersRepo>(() => OrdersRepoImpl(
      databaseService: getIT.get<DatabaseService>(),
    ));
    getIT.registerFactory<AddOrderCubit>(() => AddOrderCubit(
      ordersRepo: getIT.get<OrdersRepo>(),
    ));

}
