import 'package:bloc/bloc.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/datasources/product_datasource.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/models/response/product_response_model.dart';
import 'package:meta/meta.dart';

part 'get_all_product_event.dart';
part 'get_all_product_state.dart';

class GetAllProductBloc extends Bloc<GetAllProductEvent, GetAllProductState> {
  final ProductDatasources productDatasources;
  GetAllProductBloc(
    this.productDatasources,
  ) : super(GetAllProductInitial()) {
    on<DoGetAllProductEvent>((event, emit) async {
      emit(GetAllProductLoading());
      final result = await productDatasources.getAllProduct();
      emit(GetALlProductLoaded(listProduct: result));
    });
  }
}
