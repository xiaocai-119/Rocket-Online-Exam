<template>
  <div class="card-list" ref="content">
    <a-list
      :grid="{gutter: 24, lg: 3, md: 2, sm: 1, xs: 1}"
      :dataSource="dataSource"
    >
      <a-list-item slot="renderItem" slot-scope="item" v-if="item.flag==0">
        <a-card :hoverable="true" @click="joinExam(item.id)">
          <a-card-meta>
            <div style="margin-bottom: 3px" slot="title">{{ item.title }}</div>
            <a-avatar class="card-avatar" slot="avatar" :src="item.avatar" size="large"/>
            <div class="meta-content" slot="description">{{ item.content }}</div>
          </a-card-meta>
          <template class="ant-card-actions" slot="actions">
            <a>满分：{{ item.score }}分</a>
            <a>限时：{{ item.elapse }}分钟</a>
          </template>
        </a-card>
      </a-list-item>
    </a-list>
  </div>
</template>

<script>
import { getExamCardList, FinishExam } from '../../api/exam'
import userInfo from '../../store/modules/user'

export default {
  name: 'ExamCardList',
  data () {
    return {
      // description: '',
      // extraImage: '',
      dataSource: [],
      // 用户做过的问题都放到这个数组中，键为问题id, 值为currentQuestion(其属性answers属性用于存放答案选项地id或ids),，用于存放用户勾选的答案
      answersMap: {}
    }
  },
  methods: {
    joinExam (id) {
      console.log('准备进入考试')
      FinishExam(id, this.answersMap)
        .then(res => {
          if (res.code === 0) {
            this.$notification.success({
              message: '欢迎进入考试'
            })
            // 然后跳转到考试界面
            this.$router.push({
              path: `/exam/` + res.data.examRecordId
            })
            console.log(res.data.examRecordId)
            console.log(res.data)
          } else {
            this.$notification.error({
              message: '进入失败',
              description: res.msg
            })
          }
        })
      // const routeUrl = this.$router.resolve({
      //   path: `/exam/${id}`
      // })
      // window.open(routeUrl.href, '_blank')
    }
  },
  mounted () {
    // 从后端数据获取考试列表，适配前端卡片
    getExamCardList(userInfo.state.id).then(res => {
      console.log(res)
      if (res.code === 0) {
        this.dataSource = res.data
      } else {
        this.$notification.error({
          message: '获取考试列表失败',
          description: res.msg
        })
      }
    }).catch(err => {
      // 失败就弹出警告消息
      this.$notification.error({
        message: '获取考试列表失败',
        description: err.message
      })
    })
  }
}
</script>

<style lang="less" scoped>
  .card-avatar {
    width: 48px;
    height: 48px;
    border-radius: 48px;
  }

  .ant-card-actions {
    background: #f7f9fa;

    li {
      float: left;
      text-align: center;
      margin: 12px 0;
      color: rgba(0, 0, 0, 0.45);
      width: 50%;

      &:not(:last-child) {
        border-right: 1px solid #e8e8e8;
      }

      a {
        color: rgba(0, 0, 0, .45);
        line-height: 22px;
        display: inline-block;
        width: 100%;

        &:hover {
          color: #1890ff;
        }
      }
    }
  }

  .new-btn {
    background-color: #fff;
    border-radius: 2px;
    width: 100%;
    height: 188px;
  }

  .meta-content {
    position: relative;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    height: 64px;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
  }
</style>
