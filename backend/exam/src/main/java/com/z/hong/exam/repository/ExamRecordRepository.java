/***********************************************************
 * @Description : 
 * @author      : 梁山广(Laing Shan Guang)
 * @date        : 2019-05-14 08:23
 * @email       : liangshanguang2@gmail.com
 ***********************************************************/
package com.z.hong.exam.repository;

import com.z.hong.exam.entity.ExamRecord;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExamRecordRepository extends JpaRepository<ExamRecord, String> {
    /**
     * 获取指定用户参加过的所有考试
     *
     * @param userId 用户id
     * @return 用户参加过的所有考试
     */
    List<ExamRecord> findByExamJoinerIdAndExamIsEndOrderByExamJoinDateDesc(String userId,Boolean flag);
    ExamRecord findByExamRecordId(String examRecordId);
    ExamRecord findByExamIdAndExamJoinerId(String examId,String examJoinerId);
    List<ExamRecord> findByExamJoinerId(String examJoinerId);
}
