package kr.maak.repository;

import kr.maak.model.News;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by KIMKT on 2016-11-03.
 */
@Repository
public interface NewsRepository extends JpaRepository<News, Long> {

    @Query("SELECT n FROM News n WHERE is_closed = 0 ORDER BY modi_date DESC")
    List<News> findAll();

    @Query("SELECT n FROM News n WHERE is_closed = 0")
    List<News> findAll(Sort sort);

    @Query("SELECT n FROM News n WHERE category = :category and is_closed = 0  ORDER BY modi_date DESC")
    Page<News> findByCategory(@Param("category") String category, Pageable pageable);

    @Query("SELECT n FROM News n WHERE category = :category and is_closed = 0  ORDER BY modi_date DESC")
    List<News> findByCategory(@Param("category") String category);

    @Query("SELECT n FROM News n WHERE is_closed = 0  ORDER BY hit DESC")
    List<News> findAllByhit();

    List<News> findByIsMainAndIsClosedOrderByModiDateDesc(boolean isMain, boolean isClosed);

    @Modifying
    @Query("UPDATE News SET hit = hit + 1 WHERE id = :id")
    void updateHit(@Param("id") Long id);

    List<News> findByIsSendrssAndIsClosedOrderByModiDateDesc(boolean isSendrss, boolean isClosed);

    @Query("SELECT n FROM News n WHERE is_closed = 0 AND subject LIKE %:subject% ORDER BY regi_date DESC")
    Page<News> findAllBySubject(@Param("subject") String subject, Pageable pageable);

    News findByIdAndIsSendrssAndIsClosedOrderByModiDateDesc(Long id, boolean isSendrss, boolean isClosed);

    List<News> findByIsSendrssAndCategoryOrderByModiDateDesc(boolean isSendrss, boolean isClosed, String category);

    News findByIdAndIsFacebook(Long id, boolean isFacebook, boolean isClosed);

    List<News> findByIsSendrssAndIsClosedAndModiDateGreaterThanEqualAndModiDateLessThanEqualOrderByModiDateDesc(boolean isSendrss, boolean isClosed, Date startDate, Date endDate);

    List<News> findByIsInstantOrderByModiDateDesc(boolean isInstant);

    List<News> findByIsClosedAndIsDchoOrderByModiDateAsc(boolean isClosed, boolean isDcho);
}
