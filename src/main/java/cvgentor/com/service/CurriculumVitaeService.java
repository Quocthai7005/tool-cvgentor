package cvgentor.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cvgentor.com.model.CurriculumVitae;
import cvgentor.com.repo.CurriculumVitaeRepository;

@Service
@Transactional
public class CurriculumVitaeService {

    @Autowired
    CurriculumVitaeRepository repo;

    public void save(CurriculumVitae cv) {
        repo.save(cv);
    }

    public List<CurriculumVitae> listAll() {
        return (List<CurriculumVitae>) repo.findAll();
    }

    public CurriculumVitae get(Long id) {
        return repo.findById(id).get();
    }

    public List<CurriculumVitae> getByCategory(Long category) {
        return repo.findByCategory(category);
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}
