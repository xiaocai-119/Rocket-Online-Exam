/***********************************************************
 * @Description : 考试接口
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.service;

import com.z.hong.exam.entity.Exam;
import com.z.hong.exam.entity.ExamRecord;
import com.z.hong.exam.vo.*;

import java.util.HashMap;
import java.util.List;

public interface ExamService {
    /**
     * 获取问题的列表
     *
     * @param pageNo   页码编号
     * @param pageSize 页面大小
     * @return 页面对象
     */
    QuestionPageVo getQuestionList(Integer pageNo, Integer pageSize, String info, String userId);
    /**
     * 删除问题
     * @param id 问题id
     * @return
     */
    Integer deleteQuestionById(String id);
    /**
     * 根据前端传过来的问题实体更新问题和选项
     *
     * @param questionVo 问题实体
     */
    void updateQuestion(QuestionVo questionVo);

    /**
     * 问题创建
     *
     * @param questionCreateVo 问题创建实体类
     */
    void questionCreate(QuestionCreateVo questionCreateVo);

    /**
     * 获取问题的选项、分类和难度的下拉列表
     *
     * @return 选项、分类和难度的封装对象
     */
    QuestionSelectionVo getSelections();

    /**
     * 获取问题详情
     *
     * @param id 问题的id
     * @return 问题详情的封装VO
     */
    QuestionDetailVo getQuestionDetail(String id);

    /**
     * 获取问题的列表
     *
     * @param pageNo   页码编号
     * @param pageSize 页面大小
     * @return 考试页面对象
     */
    ExamPageVo getExamList(Integer pageNo, Integer pageSize, String info, String id);

    /**
     * 获取问题的列表
     *
     * @param id   id
     * @return
     */
    Integer deleteExamById(String id);
    /**
     * 获取所有问题的下拉列表，方便前端创建考试时筛选
     *
     * @return 适配前端的问题下拉列表
     */
    ExamQuestionTypeVo getExamQuestionType();

    /**
     * 根据前端组装的参数进行考试创建
     *
     * @param examCreateVo 前端组装的考试对象
     * @param userId       用户id
     * @return 创建好的考试
     */
    Exam create(ExamCreateVo examCreateVo, String userId) throws Exception;
    ExamRecord getExamReacord(String id);
    /**
     * 获取考试卡片列表
     *
     * @return 考试卡片列表
     */
    List<ExamCardVo> getExamCardList(String userId);

    /**
     * 根据考试的id获取考试的详情
     *
     * @param id exam表的主键
     * @return 考试详情的封装的VO对象
     */
    ExamDetailVo getExamDetail(String id);

    /**
     * 根据用户提交的作答信息进行判分
     *
     * @param userId     考试人
     * @param examId     参与的考试
     * @param answersMap 作答情况
     * @return 本次考试记录
     */
    ExamRecord judge(String userId, String examId, String recordId,HashMap<String, List<String>> answersMap);

    /**
     * 根据用户id获取此用户的所有考试信息
     *
     * @param userId 用户id
     * @return 该用户的所有考试记录
     */
    List<ExamRecordVo> getExamRecordList(String userId,String name);

    /**
     * 获取指定某次考试记录的详情
     *
     * @param recordId 考试记录的id
     * @return 考试详情
     */
    RecordDetailVo getRecordDetail(String recordId);
    /**
     * 获取用户对应的考试情况
     * @return 指定的用户的考试情况
     */
//    List<ExamUser> getExamUser(String userId);
    /**
     * 获取教师的对应的学生
     *
     * @param pageNo   页码编号
     * @param pageSize 页面大小
     * @return 页面对象
     */
    UserPageVo getStudentList(Integer pageNo, Integer pageSize, String info);
    /**
     * 获取教师的对应的学生
     *
     * @param pageNo   页码编号
     * @param pageSize 页面大小
     * @return 页面对象
     */
    ExamdataPageVo getStudentExamdata(Integer pageNo, Integer pageSize, String info);

    ExamRecord saveExamRecord(String userId, String examId, HashMap<String, List<String>> answersMap);
}
