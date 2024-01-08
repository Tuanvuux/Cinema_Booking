package mvc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import mvc.entity.OrderDetailsEntity;

import java.util.List;

@Repository
public interface OrderDetailsRepository extends CrudRepository<OrderDetailsEntity, Integer> {
    List<OrderDetailsEntity> findAll();

}
