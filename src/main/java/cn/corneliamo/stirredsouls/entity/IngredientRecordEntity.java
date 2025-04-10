package cn.corneliamo.stirredsouls.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("ingredient_record")
public class IngredientRecordEntity {

    @Id
    private Long id;

    private Long cocktailRecordId;

    private String name;

    private Long baseLiquorId;

    private Float amount;

    private String unit;

    private String type;

    private String comment;

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public Long getCocktailRecordId() { return cocktailRecordId; }

    public void setCocktailRecordId(Long cocktailRecordId) { this.cocktailRecordId = cocktailRecordId; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public Long getBaseLiquorId() { return baseLiquorId; }

    public void setBaseLiquorId(Long baseLiquorId) { this.baseLiquorId = baseLiquorId; }

    public Float getAmount() { return amount; }

    public void setAmount(Float amount) { this.amount = amount; }

    public String getUnit() { return unit; }

    public void setUnit(String unit) { this.unit = unit; }

    public String getType() { return type; }

    public void setType(String type) { this.type = type; }

    public String getComment() { return comment; }

    public void setComment(String comment) { this.comment = comment; }
}
