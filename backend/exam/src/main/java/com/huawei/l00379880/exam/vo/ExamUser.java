package com.huawei.l00379880.exam.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class ExamUser {
    @JsonProperty("id")
    private String examId;
    @JsonProperty("uId")
    private String uId;
}
