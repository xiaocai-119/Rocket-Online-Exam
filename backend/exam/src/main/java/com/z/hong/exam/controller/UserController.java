/***********************************************************
 * @Description : 用户服务
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.controller;

import com.z.hong.exam.dto.RegisterDTO;
import com.z.hong.exam.entity.User;
import com.z.hong.exam.enums.ResultEnum;
import com.z.hong.exam.qo.LoginQo;
import com.z.hong.exam.service.UserService;
import com.z.hong.exam.vo.ResultVO;
import com.z.hong.exam.vo.UserInfoVo;
import com.z.hong.exam.vo.UserVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@Api(tags = "User APIs")
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    private final Logger log = LoggerFactory.getLogger(ExamController.class);

    @PostMapping("/register")
    @ApiOperation("注册")
    ResultVO<User> register(@RequestBody RegisterDTO registerDTO) {
        log.info("/register入参为："+registerDTO.toString());
        ResultVO<User> resultVO;
        // 注册信息的完善，还有唯一性校验没(用户名、邮箱和手机号)已经在user表中通过unique来设置了
        User user = userService.register(registerDTO);
        if (user != null) {
            // 注册成功
            resultVO = new ResultVO<>(ResultEnum.REGISTER_SUCCESS.getCode(), ResultEnum.REGISTER_SUCCESS.getMessage(), user);
        } else {
            resultVO = new ResultVO<>(ResultEnum.REGISTER_FAILED.getCode(), ResultEnum.REGISTER_FAILED.getMessage(), null);
        }
        log.info(resultVO.toString());
        return resultVO;
    }

    @PostMapping("/login")
    @ApiOperation("根据用户名或邮箱登录,登录成功返回token")
    ResultVO<String> login(@RequestBody LoginQo loginQo) { // 这里不用手机号是因为手机号和用户名难以进行格式区分，而用户名和
        log.info("/login："+loginQo.toString());
        // 用户登录
        ResultVO<String> resultVO;
        String token = userService.login(loginQo);
        if (token != null) {
            // 登录成功
            resultVO = new ResultVO<>(ResultEnum.LOGIN_SUCCESS.getCode(), ResultEnum.LOGIN_SUCCESS.getMessage(), token);
        } else {
            // 登录失败
            resultVO = new ResultVO<>(ResultEnum.LOGIN_FAILED.getCode(), ResultEnum.LOGIN_FAILED.getMessage(), null);
        }
        log.info(resultVO.toString());
        return resultVO;
    }

    @GetMapping("/user-info")
    @ApiOperation("获取用户信息")
    ResultVO<UserVo> getUserInfo(HttpServletRequest request) {
        String userId = (String) request.getAttribute("user_id");
        log.info("/user-info："+userId);
        UserVo userVo = userService.getUserInfo(userId);
        return new ResultVO<>(ResultEnum.GET_INFO_SUCCESS.getCode(), ResultEnum.GET_INFO_SUCCESS.getMessage(), userVo);
    }

    @GetMapping("/info")
    @ApiOperation("获取用户的详细信息，包括个人信息页面和操作权限")
    ResultVO<UserInfoVo> getInfo(HttpServletRequest request) {
        String userId = (String) request.getAttribute("user_id");
        log.info("/info："+userId);
        UserInfoVo userInfoVo = userService.getInfo(userId);
        log.info("/info："+userInfoVo);
        return new ResultVO<>(ResultEnum.GET_INFO_SUCCESS.getCode(), ResultEnum.GET_INFO_SUCCESS.getMessage(), userInfoVo);
    }

}
