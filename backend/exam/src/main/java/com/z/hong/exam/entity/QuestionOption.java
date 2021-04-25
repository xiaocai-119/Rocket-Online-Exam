/***********************************************************
 * @Description : 问题的选项，适用于单选、多选和判断
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity
public class QuestionOption {
    @Id
    private String questionOptionId;
    private String questionOptionContent;
    private String questionOptionDescription;
}
