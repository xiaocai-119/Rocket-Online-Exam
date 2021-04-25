const api = {
  Login: '/auth/login',
  Logout: '/auth/logout',
  ForgePassword: '/auth/forge-password',
  Register: '/auth/register',
  twoStepCode: '/auth/2step-code',
  SendSmsErr: '/account/sms_err',
  // get my info
  UserInfo: '/user/info',

  // 下面是自己的用户认证的接口
  UserRegister: '/user/register',
  UserLogin: '/user/login',

  // 考试的接口
  ExamQuestionList: '/exam/question/list',
  ExamStudentList: '/exam/student/list',
  ExamdataOutput: '/exam/output',
  ExamStudentExamdata: '/exam/student/examdata',
  ExamQuestionDelete: '/exam/question/delete',
  ExamQuestionUpdate: '/exam/question/update',
  ExamQuestionSelection: '/exam/question/selection',
  ExamQuestionCreate: '/exam/question/create',
  ExamList: '/exam/list',
  ExamDelete: '/exam/delete',
  // 获取问题列表，按照单选、多选和判断进行分类
  ExamQuestionTypeList: '/exam/question/type/list',
  ExamCreate: '/exam/create',
  ExamCardList: '/exam/card/list',
  // 获取考试详情
  ExamDetail: '/exam/detail/',
  // 获取考试详情
  Exam: '/exam/look/',
  // 获取考试详情
  QuestionDetail: '/exam/question/detail/',
  // 交卷
  FinishUpdateExam: '/exam/finish/update/',
  // 交卷
  FinishExam: '/exam/finish/',
  ExamRecordList: '/exam/record/list',
  recordDetail: '/exam/record/detail/'
}
export default api
