/***********************************************************
 * @Description : 问题类型的的枚举
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.enums;

import lombok.Getter;

@Getter
public enum QuestionEnum {

    /**
     * 问题类型
     */
    RADIO(1, "单选题"),
    CHECK(2, "多选题"),
    JUDGE(3, "判断题");


    QuestionEnum(Integer id, String role) {
        this.id = id;
        this.role = role;
    }

    private Integer id;
    private String role;
}
