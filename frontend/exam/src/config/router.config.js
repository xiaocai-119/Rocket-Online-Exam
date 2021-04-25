// eslint-disable-next-line
import { UserLayout, BasicLayout, RouteView, BlankLayout, PageView } from '../layouts'
import { examList, examAdmin, questionAdmin, mine, home } from '../core/icons'

export const asyncRouterMap = [
  {
    path: '/',
    name: 'index',
    component: BasicLayout,
    meta: { title: '' },
    redirect: '/dashboard',
    children: [
      {
        path: '/dashboard',
        name: 'dashboard',
        redirect: '/dashboard/home',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '首页', keepAlive: true, icon: home, permission: ['dashboard'] },
        children: [
          {
            path: '/dashboard/home',
            name: 'Workplace',
            component: () => import('../views/Home'),
            meta: { title: '', keepAlive: false, permission: ['dashboard'] }
          }
        ]
      },
      {
        path: '/exam-card',
        name: 'exam-card',
        redirect: '/list/exam-card',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '考试列表', keepAlive: true, icon: examList, permission: ['exam-card'] },
        children: [
          {
            path: '/list/exam-card',
            name: 'ExamCardList',
            component: () => import('../views/list/ExamCardList'),
            meta: { title: '', keepAlive: false, permission: ['exam-card'] }
          }
        ]
      },
      {
        path: '/question-admin',
        name: 'question-admin',
        redirect: '/list/question-table-list',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '題目管理', keepAlive: true, icon: questionAdmin, permission: ['question-admin'] },
        children: [
          {
            path: '/list/question-table-list',
            name: 'QuestionTableListWrapper',
            component: () => import('../views/list/QuestionTableList'),
            meta: { title: '', keepAlive: true, permission: ['question-admin'] }
          }
        ]
      },
      // list
      {
        path: '/exam-table-list',
        name: 'exam-table-list',
        component: PageView,
        redirect: '/list/exam-table-list',
        hideChildrenInMenu: true,
        meta: { title: '考试管理', icon: examAdmin, permission: ['exam-table-list'] },
        children: [
          {
            path: '/list/exam-table-list',
            name: 'ExamTableListWrapper',
            component: () => import('../views/list/ExamTableList'),
            meta: { title: '', keepAlive: false, permission: ['exam-table-list'] }
          }
        ]
      },
      {
        path: '/exam-record-list',
        name: 'exam-record-list',
        redirect: '/list/exam-record-list',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '我的考试', keepAlive: true, icon: mine, permission: ['exam-record-list'] },
        children: [
          {
            path: '/list/exam-record-list',
            name: 'ExamRecordList',
            component: () => import('../views/list/ExamRecordList'),
            meta: { title: '', keepAlive: false, permission: ['exam-record-list'] }
          }
        ]
      },
      // 学生管理
      {
        path: '/student-record-list',
        name: 'student-record-list',
        redirect: '/list/student-record-list',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '考生列表', keepAlive: true, icon: mine, permission: ['student-record-list'] },
        children: [
          {
            path: '/list/student-record-list',
            name: 'StudentRecordListWrapper',
            component: () => import('../views/list/StudentRecordList'),
            meta: { title: '', keepAlive: false, permission: ['student-record-list'] }
          }
        ]
      },
      // 错题本
      {
        path: '/exam-error-question',
        name: 'exam-error-question',
        redirect: '/list/exam-error-question',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '错题题集', keepAlive: true, icon: mine, permission: ['exam-error-question'] },
        children: [
          {
            path: '/list/exam-error-question',
            name: 'StudentRecordListWrapper',
            component: () => import('../views/list/ExamErrorQuestion'),
            meta: { title: '', keepAlive: false, permission: ['exam-error-question'] }
          }
        ]
      },
      // 考试统计
      {
        path: '/exam-statistics',
        name: 'exam-statistics',
        redirect: '/list/exam-statistics',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '考试统计', keepAlive: true, icon: mine, permission: ['exam-statistics'] },
        children: [
          {
            path: '/list/exam-statistics',
            name: 'StudentRecordListWrapper',
            component: () => import('../views/list/ExamStatistics'),
            meta: { title: '', keepAlive: false, permission: ['exam-statistics'] }
          }
        ]
      },
      // account
      {
        path: '/account',
        component: RouteView,
        redirect: '/account/center',
        name: 'account',
        // 隐藏当前菜单，但是因为是需要的，所以不能删掉
        hidden: true,
        meta: { title: '个人页', icon: 'user', keepAlive: true, permission: ['user'] },
        children: [
          {
            path: '/account/settings',
            name: 'settings',
            component: () => import('../views/account/settings/Index'),
            meta: { title: '个人设置', hideHeader: true, permission: ['user'] },
            redirect: '/account/settings/base',
            hideChildrenInMenu: true,
            children: [
              {
                path: '/account/settings/base',
                name: 'BaseSettings',
                component: () => import('../views/account/settings/BaseSetting'),
                meta: { title: '基本设置', hidden: true, permission: ['user'] }
              },
              {
                path: '/account/settings/custom',
                name: 'CustomSettings',
                component: () => import('../views/account/settings/Custom'),
                meta: { title: '个性化设置', hidden: true, keepAlive: true, permission: ['user'] }
              }
            ]
          }
        ]
      }
    ]
  },
  {
    // 所有访问不到的路径最终都会落到404里
    path: '*', redirect: '/404', hidden: true
  }
]

/**
 * 基础路由，不在主菜单上展示，独立的路由
 * @type { *[] }
 */
export const constantRouterMap = [
  {
    path: '/user',
    component: UserLayout,
    redirect: '/user/login',
    hidden: true,
    children: [
      {
        path: 'login',
        name: 'login',
        component: () => import(/* webpackChunkName: "user" */ '../views/user/Login')
      },
      {
        path: 'register',
        name: 'register',
        component: () => import(/* webpackChunkName: "user" */ '../views/user/Register')
      },
      {
        path: 'register-result',
        name: 'registerResult',
        component: () => import(/* webpackChunkName: "user" */ '../views/user/RegisterResult')
      }
    ]
  },

  {
    path: '/test',
    component: BlankLayout,
    redirect: '/test/home',
    children: [
      {
        path: 'home',
        name: 'TestHome',
        component: () => import('../views/Home')
      }
    ]
  },

  {
    path: '/404',
    component: () => import('../views/exception/404')
  },
  {
    path: '/exam/:id',
    component: () => import('../views/list/ExamDetail')
  },
  {
    path: '/exam/record/:exam_id',
    component: () => import('../views/list/Exam')
  },
  {
    path: '/exam/record/:exam_id/:record_id',
    component: () => import('../views/list/ExamRecordDetail')
  }
]
