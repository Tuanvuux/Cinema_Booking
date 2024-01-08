package mvc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import mvc.entity.ProductEntity;

import java.util.List;
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {
    @Override
    Iterable<ProductEntity> findAll();



    ProductEntity findByProductId(int productId);

    List<ProductEntity> findByProductName(String productName);

}
