package com.z.hong.exam.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class TeacherStudentVo {
    @JsonProperty("id")
    private String teacherId;
    @JsonProperty("studentId")
    private String studentId;
}
