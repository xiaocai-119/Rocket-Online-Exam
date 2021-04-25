/***********************************************************
 * @Description : 
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.repository;

import com.z.hong.exam.entity.ExamRecord;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ExamRecordRepository extends JpaRepository<ExamRecord, String> {
    List<ExamRecord> findByExamJoinerIdAndExamIsEndOrderByExamJoinDateDesc(String userId,Boolean flag);
    ExamRecord findByExamRecordId(String examRecordId);
    ExamRecord findByExamIdAndExamJoinerId(String examId,String examJoinerId);
    List<ExamRecord> findByExamJoinerId(String examJoinerId);
    List<ExamRecord> findByExamId(String examId);
}
