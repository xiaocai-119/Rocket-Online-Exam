/***********************************************************
 * @Description : 用户角色表
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class Role {
    @Id
    @GeneratedValue
    private Integer roleId;
    private String roleName;
    private String roleDescription;
    private String roleDetail;
    /**
     * 角色所能访问的页面的主键集合(用-连接起来字符串)
     */
    private String rolePageIds;
}
