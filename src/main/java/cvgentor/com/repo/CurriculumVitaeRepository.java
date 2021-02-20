package cvgentor.com.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cvgentor.com.model.CurriculumVitae;

@Repository
public interface CurriculumVitaeRepository extends CrudRepository<CurriculumVitae, Long> {

    List<CurriculumVitae> findByCategory(Long category);

}
