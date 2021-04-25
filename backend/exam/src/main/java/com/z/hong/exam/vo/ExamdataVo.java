/***********************************************************
 * @Description : 考试表，要有题目、总分数、时间限制、有效日期、创建者等字段
 ***********************************************************/


package com.z.hong.exam.vo;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.z.hong.exam.entity.Exam;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ExamdataVo {
    @JsonProperty("exam")
    private Exam exam;
    @JsonProperty("names")
    private List<String> namesList;
    @JsonProperty("scores")
    private List<Double> scoresList;
    @JsonProperty("minScore")
    private Double minScore;
    @JsonProperty("maxScore")
    private Double maxScore;
    @JsonProperty("avgScore")
    private Double avgScore;
    @JsonProperty("userCount")
    private Double userCount;
}
