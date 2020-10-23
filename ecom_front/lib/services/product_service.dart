import '../repository/repository.dart';

class ProductService{
  Repository _repository;
  ProductService(){
    _repository = Repository();
  }

  getHotProducts() async{
    return await _repository.httpGet('hot-products');
  }

  getNewArrivalsProducts() async{
    return await _repository.httpGet('new-arrivals-products');
  }

  getProductsByCategory($id) async{
    return await _repository.httpGetById('products/category',$id);
  }
}