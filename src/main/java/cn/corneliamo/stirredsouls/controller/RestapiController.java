package cn.corneliamo.stirredsouls.controller;

import cn.corneliamo.stirredsouls.entity.BaseLiquorEntity;
import cn.corneliamo.stirredsouls.entity.CocktailRecordEntity;
import cn.corneliamo.stirredsouls.entity.LiquorCategoryEntity;
import cn.corneliamo.stirredsouls.repository.BaseLiquorRepository;
import cn.corneliamo.stirredsouls.repository.CocktailRecordRepository;
import cn.corneliamo.stirredsouls.repository.IngredientRecordRepository;
import cn.corneliamo.stirredsouls.repository.LiquorCategoryRepository;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class RestapiController {

    private final BaseLiquorRepository baseLiquorRepository;
    private final LiquorCategoryRepository liquorCategoryRepository;
    private final CocktailRecordRepository cocktailRecordRepository;
    private final IngredientRecordRepository ingredientRecordRepository;

    public RestapiController(BaseLiquorRepository baseLiquorRepository,
                             LiquorCategoryRepository liquorCategoryRepository,
                             CocktailRecordRepository cocktailRecordRepository,
                             IngredientRecordRepository ingredientRecordRepository) {
        this.baseLiquorRepository = baseLiquorRepository;
        this.liquorCategoryRepository = liquorCategoryRepository;
        this.cocktailRecordRepository = cocktailRecordRepository;
        this.ingredientRecordRepository = ingredientRecordRepository;
    }

    @GetMapping("/getBaseLiquorList")
    public List<BaseLiquorEntity> getBaseLiquorList() {
        return (List<BaseLiquorEntity>) baseLiquorRepository.findAll();
    }

    @PostMapping("/addBaseLiquor")
    public Boolean addBaseLiquor(@Valid @RequestBody BaseLiquorEntity baseLiquorEntity) {
        baseLiquorRepository.save(baseLiquorEntity);
        return true;
    }

    @GetMapping("/getLiquorCategoryList")
    public List<LiquorCategoryEntity> getLiquorCategoryList() {
        return (List<LiquorCategoryEntity>) liquorCategoryRepository.findAll();
    }

    @PostMapping("/addLiquorCategory")
    public boolean addLiquorCategory(@Valid @RequestBody LiquorCategoryEntity liquorCategoryEntity){
        liquorCategoryEntity.setId(null);
        liquorCategoryRepository.save(liquorCategoryEntity);
        return true;
    }

    @GetMapping("/getCocktailRecordList")
    public List<CocktailRecordEntity> getCocktailRecordList(){
        return (List<CocktailRecordEntity>) cocktailRecordRepository.findAll();
    }
}
