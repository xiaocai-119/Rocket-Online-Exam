/***********************************************************
 * @Description : 
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-05-14 08:25
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package com.huawei.l00379880.exam.repository;

import com.huawei.l00379880.exam.entity.TeacherStudent;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeacherStudentRepository extends JpaRepository<TeacherStudent, String> {


}
