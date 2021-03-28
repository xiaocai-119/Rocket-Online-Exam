<template>
  <a-layout>
    <a-layout-header class="header" style="color: #fff">
      <!--   v-if="examDetail.exam" 是为了防止 异步请求时页面渲染的时候还没有拿到这个值而报错， 下面多处这个判断都是这个道理 -->
      <span style="font-size:25px;margin-left: 0px;" v-if="examDetail.exam">
        <a-avatar slot="avatar" size="large" shape="circle" :src="examDetail.exam.examAvatar"/>
        {{ examDetail.exam.examName }}
        <span style="font-size:15px;">{{ examDetail.exam.examDescription }}</span>
      </span>
      <span style="float: right;">
        <span style="margin-right: 60px; font-size: 20px" v-if="examDetail.exam"></span>
        <a-avatar class="avatar" size="small" :src="avatar()"/>
        <span style="margin-left: 12px">{{ nickname() }}</span>
      </span>
    </a-layout-header>
    <a-layout>
      <a-layout-sider width="190" :style="{background: '#444',overflow: 'auto', height: '100vh', position: 'fixed', left: 0 }">
        <a-menu
          mode="inline"
          :defaultSelectedKeys="['1']"
          :defaultOpenKeys="['question_radio', 'question_check', 'question_judge']"
          :style="{ height: '100%', borderRight: 0 }"
        >
          <a-sub-menu key="question_radio" v-if="examDetail.radioIds!='' ">
            <span slot="title" v-if="examDetail.exam"><a-icon type="check-circle" theme="twoTone"/>单选题(每题{{ examDetail.exam.examScoreRadio }}分)</span>
            <a-menu-item v-for="(item, index) in examDetail.radioIds" :key="item" @click="getQuestionDetail(item)">
              <a-icon type="eye" theme="twoTone" twoToneColor="#52c41a" v-if="answersMap.get(item)"/>
              题目{{ index + 1 }}
            </a-menu-item>
          </a-sub-menu>
          <a-sub-menu key="question_check" v-if="examDetail.checkIds!='' ">
            <span slot="title" v-if="examDetail.exam"><a-icon type="check-square" theme="twoTone"/>多选题(每题{{ examDetail.exam.examScoreCheck }}分)</span>
            <a-menu-item v-for="(item, index) in examDetail.checkIds" :key="item" @click="getQuestionDetail(item)">
              <a-icon type="eye" theme="twoTone" twoToneColor="#52c41a" v-if="answersMap.get(item)"/>
              题目{{ index + 1 }}
            </a-menu-item>
          </a-sub-menu>
          <a-sub-menu key="question_judge" v-if="examDetail.judgeIds!='' ">
            <span slot="title" v-if="examDetail.exam"><a-icon type="like" theme="twoTone"/>判断题(每题{{ examDetail.exam.examScoreJudge }}分)</span>
            <a-menu-item v-for="(item, index) in examDetail.judgeIds" :key="item" @click="getQuestionDetail(item)">
              <a-icon type="eye" theme="twoTone" twoToneColor="#52c41a" v-if="answersMap.get(item)"/>
              题目{{ index + 1 }}
            </a-menu-item>
          </a-sub-menu>
        </a-menu>
      </a-layout-sider>
      <a-layout :style="{ marginLeft: '200px' }">
        <a-layout-content :style="{ margin: '24px 16px 0',height: '84vh', overflow: 'initial' }">
          <div :style="{ padding: '24px', background: '#fff',height: '84vh'}">
            <span v-show="currentQuestion === ''" style="font-size: 30px;font-family: Consolas">欢迎参加考试，请点击左侧题目编号开始答题</span>
            <strong>{{ currentQuestion.type }} </strong> {{ currentQuestion.name }}
            <br><br>
            <!-- 单选题和判断题 --> <!-- key不重复只需要在一个for循环中保证即可 -->
            <a-radio-group v-model="radioValue" v-if="currentQuestion.type === '单选题' || currentQuestion.type === '判断题'">
              <a-radio v-for="option in currentQuestion.options" :key="option.questionOptionId" :style="optionStyle" :value="option.questionOptionId">
                {{ option.questionOptionContent }}
              </a-radio>
            </a-radio-group>

            <!-- 多选题 -->
            <a-checkbox-group v-model="checkValues" v-if="currentQuestion.type === '多选题'">
              <a-checkbox v-for="option in currentQuestion.options" :key="option.questionOptionId" :style="optionStyle" :value="option.questionOptionId">
                {{ option.questionOptionContent }}
              </a-checkbox>
            </a-checkbox-group>
          </div>
        </a-layout-content>
        <a-layout-footer :style="{ textAlign: 'center' }">
          Online Exam ©2021 Crated by Cai Zhen Yu
        </a-layout-footer>
      </a-layout>
    </a-layout>
  </a-layout>
</template>

<script>
import { getExam, getQuestionDetail } from '../../api/exam'
import UserMenu from '../../components/tools/UserMenu'
import { mapGetters } from 'vuex'
import CountDown from '../../components/CountDown/CountDown'

export default {
  name: 'Exam',
  components: {
    UserMenu,
    CountDown
  },
  data () {
    return {
      // 考试详情对象
      examDetail: {},
      // 考试记录详情对象
      examRecordDeail: {},
      time: 0,
      // 用户做过的问题都放到这个数组中，键为问题id, 值为currentQuestion(其属性answers属性用于存放答案选项地id或ids),，用于存放用户勾选的答案
      answersMap: {},
      // 当前用户的问题
      currentQuestion: '',
      // 单选或判断题的绑定值，用于从answersMap中初始化做题状态
      radioValue: '',
      // 多选题的绑定值，用于从answersMap中初始化做题状态
      checkValues: [],
      optionStyle: {
        display: 'block',
        height: '30px',
        lineHeight: '30px',
        marginLeft: '0px'
      }
    }
  },
  mounted () {
    this.answersMap = new Map()
    const that = this
    console.log(this.$route.params.exam_id)
    getExam(this.$route.params.exam_id)
      .then(res => {
        if (res.code === 0) {
          console.log(res.data)
          // 从后端获取考试的详细信息，渲染到考试详情里
          if (res.code === 0) {
            // 赋值考试对象
            that.examDetail = res.data
            return res.data
          } else {
            this.$notification.error({
              message: '获取考试详情失败',
              description: res.msg
            })
          }
          return res.data
        } else {
          this.$notification.error({
            message: '获取考试记录详情失败',
            description: res.msg
          })
        }
      })
  },
  methods: {
    // 从全局变量中获取用户昵称和头像,
    ...mapGetters(['nickname', 'avatar']),
    getQuestionDetail (questionId) {
      // 问题切换时从后端拿到问题详情，渲染到前端content中
      const that = this
      // 清空问题绑定的值
      this.radioValue = ''
      this.checkValues = []
      getQuestionDetail(questionId)
        .then(res => {
          if (res.code === 0) {
            // 赋值当前考试对象
            that.currentQuestion = res.data
            return res.data
          } else {
            this.$notification.error({
              message: '获取问题详情失败',
              description: res.msg
            })
          }
        })
    }
  }
}
</script>

<style scoped>

</style>
