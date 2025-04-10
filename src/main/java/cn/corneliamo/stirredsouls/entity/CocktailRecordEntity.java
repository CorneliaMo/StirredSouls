package cn.corneliamo.stirredsouls.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("cocktail_record")
public class CocktailRecordEntity {

    @Id
    private Long id;

    private String name;

    private LocalDateTime time;

    private Integer rating;

    private String mood;

    private Float alcohol_content;

    private String comment;

    private Boolean isFavorite;

    private String photoPath;

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public LocalDateTime getTime() { return time; }

    public void setTime(LocalDateTime time) { this.time = time; }

    public Integer getRating() { return rating; }

    public void setRating(Integer rating) { this.rating = rating; }

    public String getMood() { return mood; }

    public void setMood(String mood) { this.mood = mood; }

    public Float getAlcohol_content() { return alcohol_content; }

    public void setAlcohol_content(Float alcohol_content) { this.alcohol_content = alcohol_content; }

    public String getComment() { return comment; }

    public void setComment(String comment) { this.comment = comment; }

    public Boolean getIsFavorite() { return isFavorite; }

    public void setIsFavorite(Boolean isFavorite) { this.isFavorite = isFavorite; }

    public String getPhotoPath() { return photoPath; }

    public void setPhotoPath(String photoPath) { this.photoPath = photoPath; }

}
