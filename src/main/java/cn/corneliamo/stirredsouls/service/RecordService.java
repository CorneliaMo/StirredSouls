package cn.corneliamo.stirredsouls.service;

import cn.corneliamo.stirredsouls.repository.BaseLiquorRepository;
import cn.corneliamo.stirredsouls.repository.CocktailRecordRepository;
import cn.corneliamo.stirredsouls.repository.IngredientRecordRepository;
import org.springframework.stereotype.Service;

@Service
public class RecordService {

    private final BaseLiquorRepository baseLiquorRepository;
    private final CocktailRecordRepository cocktailRecordRepository;
    private final IngredientRecordRepository ingredientRecordRepository;

    public RecordService(BaseLiquorRepository baseLiquorRepository,
                         CocktailRecordRepository cocktailRecordRepository,
                         IngredientRecordRepository ingredientRecordRepository) {
        this.baseLiquorRepository = baseLiquorRepository;
        this.cocktailRecordRepository = cocktailRecordRepository;
        this.ingredientRecordRepository = ingredientRecordRepository;
    }
}
