/***********************************************************
 * @Description : 登录的查询参数
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.qo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *简单无规则 登录 对象（pojo）
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginQo {
    /**
     * 1表示用户名，2表示邮箱
     */
    private Integer loginType;
    /**
     * 用户名/邮箱的字符串
     */
    private String userInfo;
    /**
     * 用户密码
     */
    private String password;
}
