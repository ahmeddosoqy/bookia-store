import 'package:bookia_store/core/model/get_best_seller_response/get_best_seller_response.dart';
import 'package:bookia_store/core/model/get_slider_model/get_slider_model.dart';
import 'package:bookia_store/core/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  GetBestSellerResponse? bestSellerResponse;
  GetSliderModel? sliderResponse;
  // fetchHomeData() async {
  //   emit(HomeLoadingState());
  //   var response = Future.value([
  //     await getBestSeller(),
  //     await getSlider(),
  //   ]);
  //   emit(HomeSuccessState());
  // }

  Future<void> getBestSeller() async {
    emit(BestSellerLoadingState());
    await HomeRepo.getBestSellers().then((value) {
      if (value != null) {
        bestSellerResponse = value;
        emit(BestSellerSuccessState());
      } else {
        emit(BestSellerErrorState("something went wrong"));
      }
    });
  }

  Future<void> getSlider() async {
    emit(SliderLoadingState());
    await HomeRepo.getSlider().then((value) {
      if (value != null) {
        sliderResponse = value;
        emit(SliderSuccessState());
      } else {
        emit(SliderErrorState("something went wrong"));
      }
    });
  }
}
