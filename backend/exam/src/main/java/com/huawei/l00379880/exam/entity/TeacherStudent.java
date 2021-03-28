/***********************************************************
 * @Description : 考试表，要有题目、总分数、时间限制、有效日期、创建者等字段
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019/5/14 07:42
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/

package com.huawei.l00379880.exam.entity;


import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
@DynamicUpdate
public class TeacherStudent {
    @Id
    private String teacherId;
    private String studentId;
}
