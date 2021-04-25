/***********************************************************
 * @Description : 
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.repository;

import com.z.hong.exam.entity.Question;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, String> {
    List<Question> findByQuestionTypeId(Integer id);
    @Query("select q from Question q where q.questionId in (?1)")
    Page<Question> findByQuestionIds(Pageable page,List<String> id);
    @Query("select q from Question q where q.questionName like %?1% and q.questionId in (?2)")
    Page<Question> findByQuestionNameAndId(Pageable page,String name,List<String> ids);
    @Query("select q from Question q where q.questionName like %?1%")
    Page<Question> findByQuestionName(Pageable page,String name);
    Integer deleteByQuestionId(String id);
}
