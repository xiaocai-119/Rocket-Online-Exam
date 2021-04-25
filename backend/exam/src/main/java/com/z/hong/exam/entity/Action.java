/***********************************************************
 * @Description : 前端的操作
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class Action {
    @Id
    @GeneratedValue
    private Integer actionId;

    private String actionName;

    private String actionDescription;

    private Boolean defaultCheck;
}
