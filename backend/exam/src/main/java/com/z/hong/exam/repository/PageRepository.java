/***********************************************************
 * @Description : 页面的数据库操作类
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.repository;

import com.z.hong.exam.entity.Page;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PageRepository extends JpaRepository<Page, Integer> {
}
