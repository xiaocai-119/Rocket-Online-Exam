/***********************************************************
 * @Description : 考试服务
 * @author      : 蔡镇宇czy
 ***********************************************************/
package com.z.hong.exam.controller;

import com.z.hong.exam.entity.Exam;
import com.z.hong.exam.entity.ExamRecord;
import com.z.hong.exam.service.ExamService;
import com.z.hong.exam.utils.BigExportExcelUtil;
import com.z.hong.exam.vo.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@Api(tags = "Exam APIs")
@RequestMapping("/exam")
public class ExamController {
    @Autowired
    private ExamService examService;

    private final Logger log = LoggerFactory.getLogger(ExamController.class);

    @GetMapping("/question/list")
    @ApiOperation("获取问题的列表")
    ResultVO<QuestionPageVo> getQuestionList(@RequestParam("pageNo") Integer pageNo, @RequestParam("pageSize") Integer pageSize, @RequestParam("info") String info, @RequestParam("userId") String userId) {
        ResultVO<QuestionPageVo> resultVO;
        try {
            QuestionPageVo questionPageVo = examService.getQuestionList(pageNo, pageSize, info, userId);
            log.info("getQuestionList："+"pageNo:"+pageNo+"pageSize:"+pageSize+"info:"+info+"userId"+userId);
            resultVO = new ResultVO<>(0, "获取问题列表成功", questionPageVo);
            log.info("getQuestionList："+resultVO);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取问题列表失败", null);
        }
        return resultVO;
    }
    @GetMapping("/question/delete")
    @ApiOperation("删除某个问题")
    ResultVO<QuestionPageVo> QuestionDelete( @RequestParam("id") String id) {
        ResultVO<QuestionPageVo> resultVO;
        try {
            Integer count = examService.deleteQuestionById(id);
            if(count >= 1){
                resultVO = new ResultVO<>(0, "删除成功", null);
            }else{
                resultVO = new ResultVO<>(0, "删除失败", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "删除失败", null);
        }
        return resultVO;
    }
    @PostMapping("/question/update")
    @ApiOperation("更新问题")
    ResultVO<String> questionUpdate(@RequestBody QuestionVo questionVo) {
        // 完成问题的更新
        System.out.println(questionVo);
        try {
            examService.updateQuestion(questionVo);
            return new ResultVO<>(0, "更新问题成功", null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultVO<>(-1, "更新问题失败", null);
        }
    }

    @PostMapping("/question/create")
    @ApiOperation("创建问题")
    ResultVO<String> questionCreate(@RequestBody QuestionCreateSimplifyVo questionCreateSimplifyVo, HttpServletRequest request) {
        QuestionCreateVo questionCreateVo = new QuestionCreateVo();
        // 把能拷贝过来的属性都拷贝过来
        BeanUtils.copyProperties(questionCreateSimplifyVo, questionCreateVo);
        // 设置创建者信息
        String userId = (String) request.getAttribute("user_id");
        questionCreateVo.setQuestionCreatorId(userId);
        System.out.println(questionCreateVo);
        try {
            examService.questionCreate(questionCreateVo);
            return new ResultVO<>(0, "问题创建成功", null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultVO<>(-1, "创建问题失败", null);
        }
    }

    @GetMapping("/question/selection")
    @ApiOperation("获取问题分类的相关选项")
    ResultVO<QuestionSelectionVo> getSelections() {
        QuestionSelectionVo questionSelectionVo = examService.getSelections();
        if (questionSelectionVo != null) {
            return new ResultVO<>(0, "获取问题分类选项成功", questionSelectionVo);
        } else {
            return new ResultVO<>(-1, "获取问题分类选项失败", null);
        }
    }

    @GetMapping("/question/detail/{id}")
    @ApiOperation("根据问题的id获取问题的详细信息")
    ResultVO<QuestionDetailVo> getQuestionDetail(@PathVariable String id) {
        //  根据问题id获取问题的详细信息
        log.info("getQuestionDetail："+id);
        ResultVO<QuestionDetailVo> resultVO;
        try {
            QuestionDetailVo questionDetailVo = examService.getQuestionDetail(id);
            resultVO = new ResultVO<>(0, "获取问题详情成功", questionDetailVo);
            log.info(resultVO.toString());
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取问题详情失败", null);
        }
        return resultVO;
    }

    @GetMapping("/list")
    @ApiOperation("获取考试管理考试列表")
    ResultVO<ExamPageVo> getExamList(@RequestParam("pageNo") Integer pageNo, @RequestParam("pageSize") Integer pageSize, @RequestParam("info") String info, @RequestParam("id") String id) {
        log.info("获取创建的考试列表,id="+id);
        // 需要拼接前端需要的考试列表对象
        ResultVO<ExamPageVo> resultVO;
        try {
            ExamPageVo examPageVo = examService.getExamList(pageNo, pageSize, info, id);
            resultVO = new ResultVO<>(0, "获取考试列表成功", examPageVo);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取考试列表失败", null);
        }
        log.info(resultVO.toString());
        return resultVO;
    }
    @GetMapping("/delete")
    @ApiOperation("根据id删除考试")
    ResultVO<ExamPageVo> deleteExamById(@RequestParam("id") String id) {
        log.info("deleteExamById,id="+id);
        // 需要拼接前端需要的考试列表对象
        ResultVO<ExamPageVo> resultVO;
        try {
            Integer count = examService.deleteExamById(id);
            if(count>=1){
                resultVO = new ResultVO<>(0, "删除成功", null);
            }else{
                resultVO = new ResultVO<>(-1, "删除失败", null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "删除失败", null);
        }
        log.info("删除考试,id="+resultVO);
        return resultVO;
    }
    @GetMapping("/student/list")
    @ApiOperation("获取学生列表")
    ResultVO<UserPageVo> getStudentList(@RequestParam("pageNo") Integer pageNo, @RequestParam("pageSize") Integer pageSize, @RequestParam("info") String info) {
        // 需要拼接前端需要的考试列表对象
        ResultVO<UserPageVo> resultVO;
        try {
            log.info("getStudentList,id="+"pageNo:"+pageNo+"pageSize:"+pageSize+"info:"+info);
            UserPageVo userPageVo = examService.getStudentList(pageNo, pageSize, info);
            resultVO = new ResultVO<>(0, "获取考试列表成功", userPageVo);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取考试列表失败", null);
        }
        log.info(resultVO.toString());
        return resultVO;
    }
    @GetMapping("/student/examdata")
    @ApiOperation("获取学生考试信息")
    ResultVO<ExamdataPageVo> getStudentExamdata(@RequestParam("pageNo") Integer pageNo, @RequestParam("pageSize") Integer pageSize, @RequestParam("info") String info) {
        // 需要拼接前端需要的考试列表对象
        ResultVO<ExamdataPageVo> resultVO;
        try {
            ExamdataPageVo examdataPageVo = examService.getStudentExamdata(pageNo, pageSize, info);
            log.info(examdataPageVo.toString());
            resultVO = new ResultVO<>(0, "获取考试统计数据成功", examdataPageVo);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取考试统计数据失败", null);
        }
        return resultVO;
    }
    @PostMapping("/output")
    @ApiOperation("导出数据")
    void outputExamdata(@RequestBody ExamdataVo examdataVo,  HttpServletResponse response) {

        try {
            log.info(examdataVo.toString());
            String examName = examdataVo.getExam().getExamName();
            List<Double> scoresList = examdataVo.getScoresList();
            List<String> namesList = examdataVo.getNamesList();
            String title ="姓名,分数";
            String[] rowsName = title.split(",");
            List<Object[]> dataList = new ArrayList<Object[]>();
            for(int i=0;i<scoresList.size();i++){
                Object[] objs = new Object[2];
                objs[0]=namesList.get(i);
                objs[1]=scoresList.get(i);
                dataList.add(objs);
            }
            Double avgScore = examdataVo.getAvgScore();
            Double minScore = examdataVo.getMinScore();
            Double maxScore = examdataVo.getMaxScore();
            //附加的一些数据
            String[] info=new String[]{"最低分："+minScore,"最高分："+maxScore,"平均分："+avgScore};
            //导出数据
            BigExportExcelUtil ex = new BigExportExcelUtil(examName, rowsName, dataList);
            OutputStream output = response.getOutputStream();
            response.setHeader("Content-Disposition", "attachment;fileName=" + examName + ".xlsx");
            //自动识别内容 multipart/form-data
            response.setContentType("application/vnd.ms-excel");
            ex.export(output,info);
            output.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @GetMapping("/question/type/list")
    @ApiOperation("获取问题列表，按照单选、多选和判断题分类返回")
    ResultVO<ExamQuestionTypeVo> getExamQuestionTypeList() {
        // 获取问题的分类列表
        ResultVO<ExamQuestionTypeVo> resultVO;
        try {
            ExamQuestionTypeVo examQuestionTypeVo = examService.getExamQuestionType();
            resultVO = new ResultVO<>(0, "获取问题列表成功", examQuestionTypeVo);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取问题列表失败", null);
        }
        return resultVO;
    }

    @PostMapping("/create")
    @ApiOperation("创建考试")
    ResultVO<Exam> createExam(@RequestBody ExamCreateVo examCreateVo, HttpServletRequest request) {
        // 从前端传参数过来，在这里完成考试的入库
        ResultVO<Exam> resultVO;
        log.info("正在创建考试："+examCreateVo);
        String userId = (String) request.getAttribute("user_id");
        try {
            Exam exam = examService.create(examCreateVo, userId);
            resultVO = new ResultVO<>(0, "创建考试成功", exam);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "创建考试失败", null);
        }
        return resultVO;
    }

    @GetMapping("/card/list")
    @ApiOperation("获取用户考试列表，适配前端卡片列表")
    ResultVO<List<ExamCardVo>> getExamCardList(@RequestParam("userId") String userId) {

        // 获取考试列表卡片
        ResultVO<List<ExamCardVo>> resultVO;
        try {
            List<ExamCardVo> examCardVoList = examService.getExamCardList(userId);
            resultVO = new ResultVO<>(0, "获取考试列表卡片成功", examCardVoList);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取考试列表卡片失败", null);
        }
        return resultVO;
    }
    @GetMapping("/look/{id}")
    @ApiOperation("根据考试的id，获取考试详情")
    ResultVO<ExamDetailVo> getExam(@PathVariable String id) {
        log.info("根据考试的id，获取考试详情"+id);
        // 根据id获取考试详情
        ResultVO<ExamDetailVo> resultVO;
        try {
            ExamDetailVo examDetail = examService.getExamDetail(id);
            resultVO = new ResultVO<>(0, "获取考试详情成功", examDetail);
        } catch (Exception e) {
            resultVO = new ResultVO<>(-1, "获取考试详情失败", null);
        }
        return resultVO;
    }
    //根据考试记录获取考试信息
    @GetMapping("/detail/{id}")
    @ApiOperation("根据考试的id，获取考试详情")
    ResultVO<ExamDetailVo> getExamDetail(@PathVariable String id) {
        // 根据id获取考试详情
        ResultVO<ExamDetailVo> resultVO;
        try {
            ExamRecord examReacord = examService.getExamReacord(id);
            ExamDetailVo examDetail = examService.getExamDetail(examReacord.getExamId());
            resultVO = new ResultVO<>(0, "获取考试详情成功", examDetail);
        } catch (Exception e) {
            resultVO = new ResultVO<>(-1, "获取考试详情失败", null);
        }
        return resultVO;
    }
    //从考试列表进入考试
    @PostMapping("/finish/{examId}")
    @ApiOperation("根据用户提交的答案对指定id的考试判分")
    ResultVO<ExamRecord> finishExam(@PathVariable String examId, @RequestBody HashMap<String, List<String>> answersMap, HttpServletRequest request) {
        log.info("根据用户提交的答案对指定id的考试判分");
        log.info(examId);
        ResultVO<ExamRecord> resultVO;
        try {
            // 拦截器里设置上的用户id
            String userId = (String) request.getAttribute("user_id");
            // 下面根据用户提交的信息进行判分,返回用户的得分情况
            ExamRecord examRecord = examService.saveExamRecord(userId, examId, answersMap);
            resultVO = new ResultVO<>(0, "考卷提交成功", examRecord);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "考卷提交失败", null);
        }
        return resultVO;
    }
    //交卷
    @PostMapping("/finish/update/{recordId}")
    @ApiOperation("根据用户提交的答案对指定id的考试判分")
    ResultVO<ExamRecord> finishUpdateExam(@PathVariable String recordId, @RequestBody HashMap<String, List<String>> answersMap, HttpServletRequest request) {
        log.info("finish/update");
        log.info(answersMap.toString());
        ResultVO<ExamRecord> resultVO;
        try {
            // 拦截器里设置上的用户id
            String userId = (String) request.getAttribute("user_id");
            // 下面根据用户提交的信息进行判分,返回用户的得分情况
            ExamRecord examReacord = examService.getExamReacord(recordId);
            String examId=examReacord.getExamId();
            ExamRecord examRecord = examService.judge(userId, examId, recordId, answersMap);
            resultVO = new ResultVO<>(0, "考卷提交成功", examRecord);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "考卷提交失败", null);
        }
        return resultVO;
    }

    @GetMapping("/record/list")
    @ApiOperation("获取当前用户的考试记录")
    ResultVO<List<ExamRecordVo>> getExamRecordList(HttpServletRequest request,@RequestParam("name") String name) {
        ResultVO<List<ExamRecordVo>> resultVO;
        try {
            // 拦截器里设置上的用户id
            String userId = (String) request.getAttribute("user_id");
            log.info("getExamRecordList,name="+name+",userId="+userId);
            // 下面根据用户账号拿到他(她所有的考试信息)，注意要用VO封装下
            List<ExamRecordVo> examRecordVoList = examService.getExamRecordList(userId,name);
            log.info(examRecordVoList.toString());
            resultVO = new ResultVO<>(0, "获取考试记录成功", examRecordVoList);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取考试记录失败", null);
        }
        return resultVO;
    }
    //考试列表进入考试的页面，获取考试详情信息
    @GetMapping("/record/detail/{recordId}")
    @ApiOperation("根据考试记录id获取考试记录详情")
    ResultVO<RecordDetailVo> getExamRecordDetail(@PathVariable String recordId) {
        log.info("根据考试记录id获取考试记录详情"+recordId);
        ResultVO<RecordDetailVo> resultVO;
        try {
            RecordDetailVo recordDetailVo = examService.getRecordDetail(recordId);
            resultVO = new ResultVO<>(0, "获取考试记录详情成功", recordDetailVo);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取考试记录详情失败", null);
        }
        return resultVO;
    }
}
