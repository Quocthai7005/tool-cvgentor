package cvgentor.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cvgentor.com.model.Category;
import cvgentor.com.repo.CategoryRepository;

@Service
@Transactional
public class CategoryService {

    @Autowired
    CategoryRepository repo;

    public void save(Category cv) {
        repo.save(cv);
    }

    public List<Category> listAll() {
        return (List<Category>) repo.findAll();
    }

    public Category get(Long id) {
        return repo.findById(id).get();
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}
