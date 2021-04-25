/***********************************************************
 * @Description : Action的前端展示类
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class ActionVo {
    @JsonProperty("action")
    private String actionName;

    @JsonProperty("describe")
    private String actionDescription;

    @JsonProperty("defaultCheck")
    private Boolean defaultCheck;
}
