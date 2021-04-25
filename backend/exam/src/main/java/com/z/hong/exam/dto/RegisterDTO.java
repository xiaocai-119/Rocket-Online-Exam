/***********************************************************
 * @Description : 注册接口参数
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.dto;

import lombok.Data;

/**
 * 封装注册，数据传输对象
 */

@Data
public class RegisterDTO {
    private String email;
    private String password;
    private String password2;
    private String mobile;
    /**
     * 验证码
     */
    private String captcha;
}
