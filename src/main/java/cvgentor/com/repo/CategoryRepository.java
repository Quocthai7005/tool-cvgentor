package cvgentor.com.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cvgentor.com.model.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long>  {

}
