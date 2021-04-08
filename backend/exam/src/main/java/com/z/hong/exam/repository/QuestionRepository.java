/***********************************************************
 * @Description : 
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-05-14 08:25
 * @email       : liangshanguang2@gmail.com
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
    Page<Question> findByQuestionId(Pageable page,List<String> id);
}
