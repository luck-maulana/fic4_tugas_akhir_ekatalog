import 'package:bloc/bloc.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/datasources/product_datasource.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/models/request/product_model.dart';
import 'package:fic4_tugas_akhir_ekatalog/data/models/response/product_response_model.dart';
import 'package:meta/meta.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final ProductDatasources productDatasources;
  CreateProductBloc(
    this.productDatasources,
  ) : super(CreateProductInitial()) {
    on<DoCreateProductEvent>((event, emit) async {
      emit(CreateProductLoading());
      final result = await productDatasources.createProduct(event.productModel);
      emit(CreateProductLoaded(productResponseModel: result));
    });
  }
}

