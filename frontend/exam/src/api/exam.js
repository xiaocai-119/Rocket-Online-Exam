// 考试相关的接口，包括考试、问题、选项和评分等接口

import api from './index'
import { axios } from '../utils/request'

export function getQuestionList (parameter, userId) {
  return axios({
    url: api.ExamQuestionList + '?userId=' + userId,
    method: 'get',
    params: parameter
  })
}
export function deleteQuestionById (id) {
  return axios({
    url: api.ExamQuestionDelete + '?id=' + id,
    method: 'get'
  })
}
export function questionUpdate (parameter) {
  console.log(parameter)
  return axios({
    url: api.ExamQuestionUpdate,
    method: 'post',
    data: parameter
  })
}

export function getQuestionSelection () {
  return axios({
    url: api.ExamQuestionSelection,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function questionCreate (parameter) {
  console.log(parameter)
  return axios({
    url: api.ExamQuestionCreate,
    method: 'post',
    data: parameter
  })
}

export function getExamList (parameter, id) {
  return axios({
    url: api.ExamList + '?id=' + id,
    method: 'get',
    params: parameter
  })
}
export function deleteExamById (id) {
  return axios({
    url: api.ExamDelete + '?id=' + id,
    method: 'get'
  })
}
// 获取考生列表
export function getExamStudentList (parameter) {
  return axios({
    url: api.ExamStudentList,
    method: 'get',
    params: parameter
  })
}
// 获取考生考试数据
export function getExamStudentExamdata (parameter) {
  return axios({
    url: api.ExamStudentExamdata,
    method: 'get',
    params: parameter
  })
}
// 导出数据
export function ExamdataOutput (parameter) {
  return axios({
    url: api.ExamdataOutput,
    method: 'post',
    data: parameter,
    responseType: 'blob'
  })
}
// 获取所有问题，按照单选、多选和判断进行分类
export function getExamQuestionTypeList () {
  return axios({
    url: api.ExamQuestionTypeList,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function getExamCardList (userId) {
  return axios({
    url: api.ExamCardList + '?userId=' + userId,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function examCreate (parameter) {
  console.log(parameter)
  return axios({
    url: api.ExamCreate,
    method: 'post',
    data: parameter
  })
}

export function getExamDetail (examId) {
  return axios({
    url: api.ExamDetail + examId,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}
export function getExam (examId) {
  return axios({
    url: api.Exam + examId,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function getExamRecordDetail (id) {
  return axios({
    url: api.recordDetail + id,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}

export function getQuestionDetail (questionId) {
  return axios({
    url: api.QuestionDetail + questionId,
    method: 'get',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}
export function FinishExam (examId, answersMap) {
  console.log(answersMap)
  return axios({
    url: api.FinishExam + examId,
    method: 'post',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    },
    data: answersMap
  })
}
export function FinishUpdateExam (recordId, answersMap) {
  console.log(answersMap)
  return axios({
    url: api.FinishUpdateExam + recordId,
    method: 'post',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    },
    data: answersMap
  })
}

export function getExamRecordList (parameter) {
  return axios({
    url: api.ExamRecordList,
    method: 'get',
    params: parameter,
    headers: {
      'Content-Type': 'application/json;charset=UTF-8'
    }
  })
}
