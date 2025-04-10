package cn.corneliamo.stirredsouls.repository;

import cn.corneliamo.stirredsouls.entity.BaseLiquorEntity;
import org.springframework.data.repository.CrudRepository;

public interface BaseLiquorRepository extends CrudRepository<BaseLiquorEntity, Long> {

    public boolean existsByName(String name);

}
