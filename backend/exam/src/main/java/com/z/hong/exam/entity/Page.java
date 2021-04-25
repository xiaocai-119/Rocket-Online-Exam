/***********************************************************
 * @Description : 前端页面实体类
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class Page {
    @Id
    @GeneratedValue
    private Integer pageId;

    private String pageName;

    private String pageDescription;

    private String actionIds;
}
