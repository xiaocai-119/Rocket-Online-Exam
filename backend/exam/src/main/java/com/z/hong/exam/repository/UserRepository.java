/***********************************************************
 * @Description : 用户表的操作类
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.repository;

import com.z.hong.exam.entity.Question;
import com.z.hong.exam.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<User, String> {
    /**
     * 根据用户名查找到合适的用户
     *
     * @param username 用户名
     * @return 唯一符合的用户(实际用户名字段已经在数据库设置unique了 ， 肯定只会返回1条)
     */
    User findByUserUsername(String username);

    /**
     * 根据用户邮箱查找合适用户
     *
     * @param email 邮箱
     * @return 唯一符合的用户(实际邮箱字段已经在数据库设置unique了 ， 肯定只会返回1条)
     */
    User findByUserEmail(String email);
    User findByUserId(String id);
    List<User> findAllByUserRoleId(Integer id);
    @Query("select u from User u where u.userUsername like %?1% and u.userRoleId = 3")
    List<User> findByUserName(String name);
}
