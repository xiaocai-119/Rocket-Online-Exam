/***********************************************************
 * @Description : 按照单选、多选和判断题返回对应的问题列表
 * @author      : 蔡镇宇(Cai Zhen Yu)
 * @date        : 2021-03-2 11:00
 ***********************************************************/
package com.huawei.l00379880.exam.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class ExamQuestionTypeVo {
    @JsonProperty("radios")
    private List<ExamQuestionSelectVo> examQuestionSelectVoRadioList;

    @JsonProperty("checks")
    private List<ExamQuestionSelectVo> examQuestionSelectVoCheckList;

    @JsonProperty("judges")
    private List<ExamQuestionSelectVo> examQuestionSelectVoJudgeList;
}
