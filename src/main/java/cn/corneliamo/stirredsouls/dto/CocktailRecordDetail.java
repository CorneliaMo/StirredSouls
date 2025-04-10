package cn.corneliamo.stirredsouls.dto;

import cn.corneliamo.stirredsouls.entity.IngredientRecordEntity;

import java.time.LocalDateTime;
import java.util.List;

public class CocktailRecordDetail {

        private Long id;

        private String name;

        private LocalDateTime time;

        private Integer rating;

        private String mood;

        private Float alcohol_content;

        private String comment;

        private Boolean isFavorite;

        private String photoPath;

        private List<IngredientRecordEntity> ingredientRecordEntityList;
}
