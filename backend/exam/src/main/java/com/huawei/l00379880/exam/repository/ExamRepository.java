/***********************************************************
 * @Description : 
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-05-14 08:22
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package com.huawei.l00379880.exam.repository;

import com.huawei.l00379880.exam.entity.Exam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExamRepository extends JpaRepository<Exam, String> {
    Page<Exam> findAllByExamCreatorId(Pageable page,String examCreatorId);
}
