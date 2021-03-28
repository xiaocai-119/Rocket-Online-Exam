<template>
  <a-card :bordered="false">
    <div class="table-page-search-wrapper">
      <a-form layout="inline">
        <a-row :gutter="48">
          <template v-if="advanced">
          </template>
        </a-row>
      </a-form>
    </div>

    <div class="table-operator">
      <a-button type="primary" icon="plus" @click="$refs.createQuestionModal.create()">新建</a-button>
      <a-button type="dashed" @click="tableOption">{{ optionAlertShow && '关闭' || '开启' }} alert</a-button>
      <a-dropdown v-action:edit v-if="selectedRowKeys.length > 0">
        <a-menu slot="overlay">
          <a-menu-item key="1">
            <a-icon type="delete"/>
            删除
          </a-menu-item>
          <!-- lock | unlock -->
          <a-menu-item key="2">
            <a-icon type="lock"/>
            锁定
          </a-menu-item>
        </a-menu>
        <a-button style="margin-left: 8px">
          批量操作
          <a-icon type="down"/>
        </a-button>
      </a-dropdown>
    </div>

    <s-table
      ref="table"
      size="default"
      rowKey="key"
      :columns="columns"
      :data="loadData"
      :alert="options.alert"
      :rowSelection="options.rowSelection"
    >
      <span slot="serial" slot-scope="text, record, index">
        {{ index + 1 }}
      </span>

    </s-table>
    <create-form ref="createModal" @ok="handleOk"/>
    <!-- ref是为了方便用this.$refs.modal直接引用，上同 -->
    <step-by-step-question-modal ref="createQuestionModal" @ok="handleOk"/>
    <question-view-modal ref="modalView" @ok="handleOk"/>
    <question-edit-modal ref="modalEdit" @ok="handleOk"/>
  </a-card>
</template>

<script>
import moment from 'moment'
import { STable } from '../../components'
import QuestionViewModal from './modules/QuestionViewModal'
import QuestionEditModal from './modules/QuestionEditModal'
import StepByStepQuestionModal from './modules/StepByStepQuestionModal'
import CreateForm from './modules/CreateForm'
import userInfo from '../../store/modules/user'
import { getExamStudentList } from '../../api/exam'

export default {
  name: 'ExamStudentList',
  components: {
    StepByStepQuestionModal,
    STable,
    CreateForm,
    QuestionViewModal,
    QuestionEditModal
  },
  data () {
    return {
      mdl: {},
      // 高级搜索 展开/关闭
      advanced: false,
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
        // 从表格组件中获取分页参数
        console.log('loadData.parameter', parameter)
        // 给queryParam赋值，然后把queryParam传给后端
        return getExamStudentList(Object.assign(parameter), userInfo.state.id)
          .then(res => {
            if (res.code === 0) {
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
