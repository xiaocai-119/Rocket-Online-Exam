/***********************************************************
 * @Description : 前端创建问题时的下拉列表选择
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.z.hong.exam.entity.QuestionCategory;
import com.z.hong.exam.entity.QuestionLevel;
import com.z.hong.exam.entity.QuestionType;
import lombok.Data;

import java.util.List;

@Data
public class QuestionSelectionVo {
    @JsonProperty("types")
    private List<QuestionType> questionTypeList;

    @JsonProperty("categories")
    private List<QuestionCategory> questionCategoryList;

    @JsonProperty("levels")
    private List<QuestionLevel> questionLevelList;
}
