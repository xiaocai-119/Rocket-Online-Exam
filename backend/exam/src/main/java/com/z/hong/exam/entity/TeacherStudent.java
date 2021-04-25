/***********************************************************
 * @Description : 考试表，要有题目、总分数、时间限制、有效日期、创建者等字段
 * @author      : 蔡镇宇czy
 ***********************************************************/

package com.z.hong.exam.entity;


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
