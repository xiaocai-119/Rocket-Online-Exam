/***********************************************************
 * @Description : 考试卡片列表
 ***********************************************************/
package com.z.hong.exam.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.Date;

@Data
public class ExamCardVo {
    @JsonProperty("id")
    private String examId;
    @JsonProperty("title")
    private String examName;
    @JsonProperty("avatar")
    private String examAvatar;
    @JsonProperty("content")
    private String examDescription;
    @JsonProperty("score")
    private Integer examScore;
    @JsonProperty("startDate")
    private Date examStartDate;
    /**
     * 0 为结束
     * 1 结束
     */
    @JsonProperty("flag")
    private Integer examFlag;
    /**
     * 考试限制的时间，单位为分钟
     */
    @JsonProperty("elapse")
    private Integer examTimeLimit;
}
