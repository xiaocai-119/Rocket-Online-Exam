/***********************************************************
 * @Description : 
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-05-14 08:22
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package com.z.hong.exam.repository;

import com.z.hong.exam.entity.Exam;
import com.z.hong.exam.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExamRepository extends JpaRepository<Exam, String> {
    Page<Exam> findAllByExamCreatorId(Pageable page,String examCreatorId);
    Exam findByExamId(String id);
    List<Exam> findAllByExamCreatorId(Iterable<String> examCreatorId);
}
