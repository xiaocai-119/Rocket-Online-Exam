import Vue from 'vue'
import router from './router'
import store from './store'

import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css' // progress bar style
import notification from 'ant-design-vue/es/notification'
import { setDocumentTitle, domTitle } from './utils/domUtil'
import { ACCESS_TOKEN } from './store/mutation-types'

NProgress.configure({ showSpinner: false }) // NProgress Configuration

const whiteList = ['login', 'register', 'registerResult'] // no redirect whitelist, 免登录白名单

router.beforeEach((to, from, next) => {
  NProgress.start() // start progress bar
  to.meta && (typeof to.meta.title !== 'undefined' && setDocumentTitle(`${to.meta.title} - ${domTitle}`))
  if (Vue.ls.get(ACCESS_TOKEN)) {
    /* has token, 有token,即用户已经登录 */
    if (to.path === '/user/login' || to.path === '/') {
      // 如果用户想访问登录界面就直接跳到首页
      next({ path: '/dashboard' })
      NProgress.done()
    } else {
      // 用户已经登录，且访问地不是登录页面，那么就进行权限校验，看看用户有没有权限访问这个页面
      if (store.getters.roles.length === 0) { // 如果store还没有用户的角色属性(可以在Vue的Chrome组件中看Vuex)，那就请求
        store
          .dispatch('GetInfo') // 登陆后访问除登录以外的任何一个页面都会先调用GetInfo方法，看看用户的权限是否有资格访问
          .then(res => {
            const roles = res.data && res.data.role // 响应不为空，而且含有role属性
            store.dispatch('GenerateRoutes', { roles }).then(() => { // 遍历roles，生成路由
              // 根据roles权限生成可访问的路由表
              // 动态添加可访问路由表
              router.addRoutes(store.getters.addRouters)
              const redirect = decodeURIComponent(from.query.redirect || to.path)
              if (to.path === redirect) {
                // hack方法 确保addRoutes已完成 ,set the replace: true so the navigation will not leave a history record
                next({ ...to, replace: true })
              } else {
                // 跳转到目的路由
                next({ path: redirect })
              }
            })
          })
          .catch(() => {
            notification.error({
              message: '错误',
              description: '请求用户信息失败，请重试'
            })
            store.dispatch('Logout').then(() => {
              // next({ path: '/user/login', c })
              next({ path: '/user/login' })
            })
          })
      } else {
        next()
      }
    }
  } else {
    if (whiteList.includes(to.name)) {
      // 在免登录白名单，直接进入
      next()
    } else {
      next({ path: '/user/login' })
      NProgress.done() // if current page is login will not trigger afterEach hook, so manually handle it
    }
  }
})

router.afterEach(() => {
  NProgress.done() // finish progress bar
})
