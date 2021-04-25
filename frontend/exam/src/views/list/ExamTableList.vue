<template>
  <a-card :bordered="false">
    <div class="table-page-search-wrapper">
      <a-form layout="inline" style="margin-left: 200px" :form="form">
        <a-row :gutter="48">
          <a-col :md="10" :sm="100">
            <a-form-item label="名称">
              <a-input
                type="text"
                v-decorator="['info', {rules: [{ required: false}], validateTrigger: 'blur'}]"
              >
              </a-input>
            </a-form-item>
          </a-col>
          <a-col :md=" 8 || 24" :sm="24">
            <span
              class="table-page-search-submitButtons"
              :style="{ float: 'right', overflow: 'hidden' } || {} ">
              <a-button type="primary" @click="findByInfo">查询</a-button>
            </span>
          </a-col>
        </a-row>
      </a-form>
    </div>

    <div class="table-operator">
      <a-button type="primary" icon="plus" @click="createExamOne">新建</a-button>
    </div>

    <s-table
      ref="table"
      size="default"
      rowKey="key"
      :columns="columns"
      :data="loadData"
    >
      <span slot="serial" slot-scope="text, record, index">
        {{ index + 1 }}
      </span>

      <span slot="action" slot-scope="text, record">
        <template>
          <a @click="handleSub(record)">详情</a>
          <a-divider type="vertical"/>
          <a @click="handleEdit(record)">编辑</a>
          <a-divider type="vertical"/>
          <a @click="handleDelete(record)">删除</a>
        </template>
      </span>

    </s-table>
    <create-form ref="createModal" @ok="handleOk"/>
    <!-- ref是为了方便用this.$refs.modal直接引用，上同 -->
    <step-by-step-exam-modal ref="createExamModal" @ok="handleOk"/>
    <question-edit-modal ref="modalEdit" @ok="handleOk"/>
  </a-card>
</template>

<script>
import moment from 'moment'
import { STable } from '../../components'
import QuestionEditModal from './modules/ErrorQuestionEditModal'
import CreateForm from './modules/CreateForm'
import { getExamList, deleteExamById } from '../../api/exam'
import StepByStepExamModal from './modules/StepByStepExamModal'
import userInfo from '../../store/modules/user'

export default {
  name: 'ExamTableList',
  components: {
    StepByStepExamModal,
    STable,
    CreateForm,
    QuestionEditModal
  },
  inject: ['reload'],
  data () {
    return {
      form: this.$form.createForm(this),
      mdl: {},
      flag: false,
      name: '',
      // 查询参数
      queryParam: {},
      // 表头
      columns: [
        {
          title: '#',
          scopedSlots: { customRender: 'serial' }
        },
        {
          title: '名称',
          dataIndex: 'name',
          width: 200
        },
        {
          title: '总分数',
          dataIndex: 'score'
        },
        {
          title: '创建人',
          dataIndex: 'creator'
        },
        {
          title: '时长',
          dataIndex: 'elapse'
        },
        {
          title: '更新时间',
          dataIndex: 'updateTime'
        },
        {
          title: '操作',
          dataIndex: 'action',
          width: '200px',
          scopedSlots: { customRender: 'action' }
        }
      ],
      // 取parameter变量，当变化时，自动重新请求后端数据。加载数据方法 必须为 Promise 对象
      loadData: parameter => {
        // 从表格组件中获取分页参数
        this.queryParam.pageNo = parameter.pageNo
        if (this.flag) {
          this.queryParam.pageNo = 1
        }
        this.queryParam.pageSize = parameter.pageSize
        this.queryParam.info = this.name
        // 从表格组件中获取分页参数
        console.log('loadData.parameter', parameter)
        // 给queryParam赋值，然后把queryParam传给后端,待数据验证
        return getExamList(this.queryParam, userInfo.state.id)
          .then(res => {
            if (res.code === 0) {
              return res.data
            } else {
              this.$notification.error({
                message: '获取考試列表失败',
                description: res.msg
              })
            }
          })
      },
      selectedRowKeys: [],
      selectedRows: [],

      // custom table alert & rowSelection
      options: {
        alert: {
          show: true,
          clear: () => {
            this.selectedRowKeys = []
          }
        },
        rowSelection: {
          selectedRowKeys: this.selectedRowKeys,
          onChange: this.onSelectChange
        }
      },
      optionAlertShow: false
    }
  },
  created () {
    this.tableOption()
  },
  methods: {
    createExamOne () {
      this.$refs.createExamModal.create()
    },
    findByInfo () {
      console.log(this.form.getFieldValue('info'))
      this.name = this.form.getFieldValue('info')
      this.flag = true
      if (this.form.getFieldValue('info') === undefined) {
        this.name = ''
      }
      console.log(this.loadData(this.queryParam))
      const a = Promise.resolve(this.loadData(this.queryParam))
      const that = this
      a.then(function (result) {
        that.$refs.table.localDataSource = result.data
        that.$refs.table.localPagination = {
          current: 1,
          pageSize: 10,
          showSizeChanger: true,
          total: result.totalCount
        }
        that.flag = false
      })
    },
    tableOption () {
      if (!this.optionAlertShow) {
        this.options = {
          alert: {
            show: true,
            clear: () => {
              this.selectedRowKeys = []
            }
          },
          rowSelection: {
            selectedRowKeys: this.selectedRowKeys,
            onChange: this.onSelectChange
          }
        }
        this.optionAlertShow = true
      } else {
        this.options = {
          alert: false,
          rowSelection: null
        }
        this.optionAlertShow = false
      }
    },

    handleEdit (record) {
      console.log(record)
      this.$refs.createExamModal.update(record)
    },
    handleDelete (record) {
      const that = this
      if (new Date(record.startDate).getTime() < new Date().getTime() && new Date(record.endDate).getTime() > new Date().getTime()) {
        this.$notification.error({
          message: '无法删除',
          description: '考试已开始了'
        })
        return
      }
      this.$confirm({
        title: '是否删除该考试？',
        content: '',
        okText: '确认',
        cancelText: '取消',
        onOk () {
          console.log(record)
          deleteExamById(record.id)
          that.reload()
        }
      })
    },
    handleSub (record) {
      // 查看题目，不在模态框里查啦，太麻烦
      console.log(record)
      // this.$refs.modalView.edit(record)

      // 直接跳到参加考试的页面，查看所有题目的详细情况
      const routeUrl = this.$router.resolve({
        path: `/exam/record/${record.id}`
      })
      // 和点击考试卡片效果一样，跳转到考试页面，里面有所有题目的情况，相当于就是详情了
      window.open(routeUrl.href, '_blank')
    },
    handleOk () {
      this.$refs.table.refresh()
    },
    onSelectChange (selectedRowKeys, selectedRows) {
      this.selectedRowKeys = selectedRowKeys
      this.selectedRows = selectedRows
    },
    resetSearchForm () {
      this.queryParam = {
        date: moment(new Date())
      }
    }
  }
}
</script>
