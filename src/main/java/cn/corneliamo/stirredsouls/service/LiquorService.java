package cn.corneliamo.stirredsouls.service;

import cn.corneliamo.stirredsouls.entity.BaseLiquorEntity;
import cn.corneliamo.stirredsouls.entity.LiquorCategoryEntity;
import cn.corneliamo.stirredsouls.repository.BaseLiquorRepository;
import cn.corneliamo.stirredsouls.repository.LiquorCategoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LiquorService {

    private final BaseLiquorRepository baseLiquorRepository;
    private final LiquorCategoryRepository liquorCategoryRepository;

    public LiquorService(BaseLiquorRepository baseLiquorRepository,
                         LiquorCategoryRepository liquorCategoryRepository){
        this.baseLiquorRepository = baseLiquorRepository;
        this.liquorCategoryRepository = liquorCategoryRepository;
    }

    public List<LiquorCategoryEntity> getLiquorCategoryList(){
        return (List<LiquorCategoryEntity>) liquorCategoryRepository.findAll();
    }

    public List<BaseLiquorEntity> getBaseLiquorList(){
        return (List<BaseLiquorEntity>) baseLiquorRepository.findAll();
    }

    public void addLiquorCategory(LiquorCategoryEntity liquorCategoryEntity){
        if (liquorCategoryRepository.existsByName(liquorCategoryEntity.getName())) {
            throw new IllegalArgumentException("基酒大类存在重复名称");
        }
        liquorCategoryEntity.setId(null);
        liquorCategoryRepository.save(liquorCategoryEntity);
    }

    public void addBaseLiquor(BaseLiquorEntity baseLiquorEntity){
        if (!liquorCategoryRepository.existsById(baseLiquorEntity.getCategoryId())) {
            throw new IllegalArgumentException("引用的基酒大类id无效");
        }
        if (baseLiquorRepository.existsByName(baseLiquorEntity.getName())) {
            throw new IllegalArgumentException("基酒存在重复名称");
        }
        baseLiquorEntity.setId(null);
        baseLiquorRepository.save(baseLiquorEntity);
    }
}
