/***********************************************************
 * @Description : 
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.repository;

import com.z.hong.exam.entity.Exam;
import com.z.hong.exam.entity.Question;
import com.z.hong.exam.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ExamRepository extends JpaRepository<Exam, String> {
    Page<Exam> findAll(Pageable page);
    Page<Exam> findAllByExamCreatorId(Pageable page,String examCreatorId);
    Exam findByExamId(String id);
    List<Exam> findAllByExamCreatorId(Iterable<String> examCreatorId);
    @Query("select e from Exam e where e.examName like %?1% and e.examCreatorId = ?2")
    Page<Exam> findByExamName(Pageable page, String name, String id);
    @Query("select e from Exam e where e.examName like %?1%")
    Page<Exam> findAllByExamName(Pageable page, String name);
    Integer deleteByExamId(String id);
}
