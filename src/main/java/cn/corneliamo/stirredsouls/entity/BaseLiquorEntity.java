package cn.corneliamo.stirredsouls.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table("base_liquor")
public class BaseLiquorEntity {

    @Id
    private Long id;

    private Long categoryId;

    private String name;

    private Float alcoholContent;

    private String comment;

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public Long getCategoryId() { return categoryId; }

    public void setCategoryId(Long categoryId) { this.categoryId = categoryId; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public Float getAlcoholContent() { return alcoholContent; }

    public void setAlcoholContent(Float alcoholContent) { this.alcoholContent = alcoholContent; }

    public String getComment() { return comment; }

    public void setComment(String comment) { this.comment = comment; }
}
