package cn.corneliamo.stirredsouls.repository;

import cn.corneliamo.stirredsouls.entity.LiquorCategoryEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LiquorCategoryRepository extends CrudRepository<LiquorCategoryEntity, Long> {

    public boolean existsByName(String name);

    public List<LiquorCategoryEntity> findAllByName(String name);

    public boolean existsById(Long id);

    public List<LiquorCategoryEntity> findAllById(Long id);
}
