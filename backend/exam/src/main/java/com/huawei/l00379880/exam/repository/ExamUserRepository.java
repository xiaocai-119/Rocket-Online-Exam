package com.huawei.l00379880.exam.repository;

import com.huawei.l00379880.exam.entity.ExamUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExamUserRepository extends JpaRepository<ExamUser, String> {

    ExamUser findByExamIdAndUId(String examId,String uId);
}
