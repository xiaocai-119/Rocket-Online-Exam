<template>
  <a-card :bordered="false">
    <div class="table-page-search-wrapper">
      <a-form layout="inline" style="margin-left: 200px" :form="form">
        <a-row :gutter="48">
          <a-col :md="10" :sm="100">
            <a-form-item label="题干">
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

    <div class="table-operator">
      <a-button type="primary" icon="plus" @click="createQuestion">新建</a-button>
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
          <a @click="handleEdit(record)">编辑</a>
          <a-divider type="vertical"/>
          <a @click="handleDelete(record)">删除</a>
        </template>
      </span>

    </s-table>
    <create-form ref="createModal" @ok="handleOk"/>
    <!-- ref是为了方便用this.$refs.modal直接引用，上同 -->
    <step-by-step-question-modal ref="createQuestionModal" @ok="handleOk"/>
    <question-edit-modal ref="modalEdit" @ok="handleOk"/>
  </a-card>
</template>

<script>
import moment from 'moment'
import { STable } from '../../components'
import QuestionEditModal from './modules/QuestionEditModal'
import StepByStepQuestionModal from './modules/StepByStepQuestionModal'
import CreateForm from './modules/CreateForm'
import { getQuestionList, deleteQuestionById } from '../../api/exam'

export default {
  name: 'QuestionTableList',
  inject: ['reload'],
  components: {
    StepByStepQuestionModal,
    STable,
    CreateForm,
    QuestionEditModal
  },
  data () {
    return {
      form: this.$form.createForm(this),
      mdl: {},
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
          title: '题干',
          dataIndex: 'name',
          width: 250
        },
        {
          title: '分数',
          dataIndex: 'score'
        },
        {
          title: '创建人',
          dataIndex: 'creator'
        },
        {
          title: '难度',
          dataIndex: 'level'
        },
        {
          title: '题型',
          dataIndex: 'type'
        },
        {
          title: '学科',
          dataIndex: 'category'
        },
        {
          title: '更新时间',
          dataIndex: 'updateTime'
        },
        {
          title: '操作',
          dataIndex: 'action',
          width: '150px',
          scopedSlots: { customRender: 'action' }
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
        return getQuestionList(this.queryParam, '')
          .then(res => {
            if (res.code === 0) {
              console.log(this.$refs.table)
              console.log(res.data)
              return res.data
            } else {
              this.$notification.error({
                message: '获取问题列表失败',
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
    createQuestion () {
      this.$refs.createQuestionModal.create()
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
    handleDelete (record) {
      const that = this
      this.$confirm({
        title: '是否删除该题目？',
        content: '',
        okText: '确认',
        cancelText: '取消',
        onOk () {
          // 删除数据
          console.log(record)
          deleteQuestionById(record.id)
          that.reload()
        }
      })
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
