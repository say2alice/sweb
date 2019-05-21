package kr.maak.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

import javax.persistence.*;
import java.sql.Timestamp;

import static com.lyncode.jtwig.functions.util.HtmlUtils.stripTags;

/**
 * Created by KIMKT on 2016-11-03.
 */
@Entity
@Data
@EqualsAndHashCode(callSuper = false)
public class News {
    @Id
    @GeneratedValue
    @Column(updatable = false, insertable = false)
    @Generated(GenerationTime.INSERT)
    protected Long id;

    @Column(nullable = false, length = 10, columnDefinition = "issue")
    private String category;

    @Column
    private String subject;

    @Column(length = 1000)
    private String content;

    @Column(nullable = false, length = 20, columnDefinition = "0")
    private long hit;

    @Generated(GenerationTime.INSERT)
    @Column(name = "regi_date", updatable = false, insertable = false)
    private Timestamp regiDate;

    @Column
    private String writer;

    @Generated(GenerationTime.INSERT)
    @Column(name = "modi_date", updatable = false, insertable = false)
    private Timestamp modiDate;

    @Column
    private String image;

    @Column(name = "is_closed", nullable = false)
    private boolean isClosed;

    @Column(name = "is_sendrss", nullable = false)
    private boolean isSendrss;

    @Column(name = "is_main", nullable = false)
    private boolean isMain;

    @Column(name = "is_facebook", nullable = false)
    private boolean isFacebook;

    @Column(name = "is_instant", nullable = false)
    private boolean isInstant;

    @Column(name = "is_dcho", nullable = false)
    private boolean isDcho;

    @Transient
    private String originImage;

    @Transient
    private String summary;

    public String getImage(){
        return this.image.replace("https://s3.ap-northeast-2.amazonaws.com","http://imgmaak.petaz.co.kr");
    }

    public String getContent(){
        return this.content.replace("https://s3.ap-northeast-2.amazonaws.com","http://imgmaak.petaz.co.kr")
                .replace("<div class=\"ad_div\">&nbsp;</div>", "<script async src='//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js'></script>" +
                        "<ins class='adsbygoogle' style='display:block; text-align:center;' data-ad-layout='in-article'  data-ad-format='fluid' data-ad-client='ca-pub-2522869015643333'  data-ad-slot='1525807737'></ins> " +
                        "<script>(adsbygoogle = window.adsbygoogle || []).push({});</script>");
    }

    public String getOriginImage() {
        return this.getImage().replace("/thumb/thumb-", "/origin/");
    }

    public String getSummary(){return stripTags(this.getContent(), "").replace("&nbsp;", "").replace("&#39;", "'").replace("&quot;","\""); }

    public String getCategory(){
        if(this.category.equals("hot")){
            return this.category.replace("hot","tip");
        }
        return this.category;
    }

}
