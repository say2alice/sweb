package kr.maak.model.form;

import lombok.Data;

/**
 * Created by lilly on 2016-07-07.
 */

@Data
public class RssForm {

    private String title;

    private String link;

    private String description;

    private String author;

    private String category;

    private String pubDate;

    private String imageFile;

}
