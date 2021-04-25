/***********************************************************
 * @Description : 用户角色的枚举
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.enums;

import lombok.Getter;

@Getter
public enum RoleEnum {

    /**
     * 用户角色，和数据库里面的role表相对应
     */
    ADMIN(1, "管理员"),
    TEACHER(2, "教师"),
    STUDENT(3, "学生");


    RoleEnum(Integer id, String role) {
        this.id = id;
        this.role = role;
    }

    private Integer id;
    private String role;
}
