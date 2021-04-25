/***********************************************************
 * @Description : 角色的数据库操作类
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.repository;

import com.z.hong.exam.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer> {
}
