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
          <a-col :md="8 || 24" :sm="24">
            <span
              class="table-page-search-submitButtons"
              :style="{ float: 'right', overflow: 'hidden' } || {} ">
              <a-button type="primary" @click="findByInfo">查询</a-button>
            </span>
          </a-col>
        </a-row>
      </a-form>
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

    </s-table>
    <create-form ref="createModal" @ok="handleOk"/>
    <!-- ref是为了方便用this.$refs.modal直接引用，上同 -->
    <step-by-step-question-modal ref="createQuestionModal" @ok="handleOk"/>
  </a-card>
</template>

<script>
import moment from 'moment'
import { STable } from '../../components'
import StepByStepQuestionModal from './modules/StepByStepQuestionModal'
import CreateForm from './modules/CreateForm'
import { getExamStudentList } from '../../api/exam'

export default {
  name: 'ExamStudentList',
  components: {
    StepByStepQuestionModal,
    STable,
    CreateForm
  },
  data () {
    return {
      mdl: {},
      form: this.$form.createForm(this),
      // 高级搜索 展开/关闭
      advanced: false,
      name: '',
      flag: false,
      // 查询参数
      queryParam: {},
      // 表头
      columns: [
        {
          title: '#',
          scopedSlots: { customRender: 'serial' }
        },
        {
          title: '账号',
          dataIndex: 'username',
          width: 250
        },
        {
          title: '用户名',
          dataIndex: 'nickname'
        },
        {
          title: '邮箱',
          dataIndex: 'email'
        },
        {
          title: '手机号码',
          dataIndex: 'phone'
        }

      ],
      // 计算属性，监听parameter变量，当变化时，自动重新请求后端数据。加载数据方法 必须为 Promise 对象.获取分页数据
      loadData: parameter => {
        this.queryParam.pageNo = parameter.pageNo
        if (this.flag) {
          this.queryParam.pageNo = 1
        }
        this.queryParam.pageSize = parameter.pageSize
        this.queryParam.info = this.name
        // 从表格组件中获取分页参数
        console.log('loadData.parameter', parameter)
        // 给queryParam赋值，然后把queryParam传给后端
        return getExamStudentList(this.queryParam)
          .then(res => {
            if (res.code === 0) {
              return res.data
            } else {
              this.$notification.error({
                message: '获取学生列表失败',
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
          pageNum: result.totalPage,
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
      // 弹出一个可修改的输入框
      console.log(record)
      this.$refs.modalEdit.edit(record)
    },
    handleSub (record) {
      // 查看题目
      console.log(record)
      this.$refs.modalView.edit(record)
    },
    handleOk () {
      this.$refs.table.refresh()
    },
    onSelectChange (selectedRowKeys, selectedRows) {
      this.selectedRowKeys = selectedRowKeys
      this.selectedRows = selectedRows
    },
    toggleAdvanced () {
      this.advanced = !this.advanced
    },
    resetSearchForm () {
      this.queryParam = {
        date: moment(new Date())
      }
    }
  }
}
</script>
