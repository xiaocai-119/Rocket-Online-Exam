/***********************************************************
 * @Description : 考试详情的实体类
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.vo;

import com.z.hong.exam.entity.Exam;
import lombok.Data;

@Data
public class ExamDetailVo {
    /**
     * 考试的基本信息对象
     */
    private Exam exam;

    /**
     * 单选题的id数组
     */
    private String[] radioIds;

    /**
     * 多选题的id数组
     */
    private String[] checkIds;

    /**
     * 判断题的id数组
     */
    private String[] judgeIds;

}
