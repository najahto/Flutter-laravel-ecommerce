import '../repository/repository.dart';

class ProductService{
  Repository _repository;
  ProductService(){
    _repository = Repository();
  }

  getHotProducts() async{
    return await _repository.httpGet('hot-products');
  }
}