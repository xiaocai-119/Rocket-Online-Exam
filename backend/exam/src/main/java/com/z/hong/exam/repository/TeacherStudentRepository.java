/***********************************************************
 * @Description : 
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-05-14 08:25
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package com.z.hong.exam.repository;

import com.z.hong.exam.entity.TeacherStudent;
import com.z.hong.exam.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeacherStudentRepository extends JpaRepository<TeacherStudent, String> {

    List<TeacherStudent> findByStudentId(String id);
}