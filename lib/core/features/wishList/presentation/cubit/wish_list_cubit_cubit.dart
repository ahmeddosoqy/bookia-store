import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wish_list_cubit_state.dart';

class WishListCubitCubit extends Cubit<WishListCubitState> {
  WishListCubitCubit() : super(WishListCubitInitial());
}
