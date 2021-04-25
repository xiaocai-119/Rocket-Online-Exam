/***********************************************************
 * @Description : 考试记录VO
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.vo;

import com.z.hong.exam.entity.Exam;
import com.z.hong.exam.entity.ExamRecord;
import com.z.hong.exam.entity.User;
import lombok.Data;

@Data
public class ExamRecordVo {
    /**
     * 当前考试记录对应的考试
     */
    private Exam exam;

    /**
     * 当前考试对应的内容
     */
    private ExamRecord examRecord;

    /**
     * 参加考试的用户信息
     */
    private User user;
}
