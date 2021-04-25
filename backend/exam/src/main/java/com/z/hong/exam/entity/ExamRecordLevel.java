/***********************************************************
 * @Description : 考试得分级别
 * @author      : 蔡镇宇czy
 * @date        : 2021-03-01
 ***********************************************************/
package com.z.hong.exam.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class ExamRecordLevel {
    @Id
    @GeneratedValue
    private Integer examRecordLevelId;
    private String examRecordLevelName;
    private String examRecordLevelDescription;
}
