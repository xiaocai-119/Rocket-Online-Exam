<script>
import ASwitch from 'ant-design-vue/es/switch'
import AList from 'ant-design-vue/es/list'
import AListItem from 'ant-design-vue/es/list/Item'
import { mixin } from '../../../utils/mixin'

const Meta = AListItem.Meta

export default {
  components: {
    AListItem,
    AList,
    ASwitch,
    Meta
  },
  mixins: [mixin],
  primaryColor: '#1890FF',
  data () {
    return {
    }
  },
  filters: {
    themeFilter (theme) {
      const themeMap = {
        'dark': '暗色',
        'light': '白色'
      }
      return themeMap[theme]
    }
  },
  methods: {
    colorFilter (color) {
      const colorList = [
        {
          key: '薄暮', color: '#F5222D'
        },
        {
          key: '火山', color: '#FA541C'
        },
        {
          key: '日暮', color: '#FAAD14'
        },
        {
          key: '明青', color: '#13C2C2'
        },
        {
          key: '极光绿', color: '#52C41A'
        },
        {
          key: '拂晓蓝（默认）', color: '#1890FF'
        },
        {
          key: '极客蓝', color: '#2F54EB'
        },
        {
          key: '酱紫', color: '#722ED1'
        }
      ]
      const c = colorList.filter(o => o.color === color)[0]
      return c && c.key
    },

    onChange (checked) {
      if (checked) {
        this.$store.dispatch('ToggleTheme', 'dark')
      } else {
        this.$store.dispatch('ToggleTheme', 'light')
      }
    }
  },
  render () {
    return (
      <AList itemLayout="horizontal">
        <AListItem>
          <Meta>
            <div slot="title">风格配色</div>
            <span
              slot="description">
                整体风格配色设置
            </span>
          </Meta>
          <div slot="actions">
            <ASwitch checkedChildren="暗色" unCheckedChildren="白色" defaultChecked={this.navTheme === 'dark' && true || false} onChange={this.onChange} />
          </div>
        </AListItem>
        <AListItem>
          <Meta>
            <div slot="title">主题色</div>
            <span slot="description">
                页面风格配色： <span domPropsInnerHTML={ this.colorFilter('#1890FF') } style="float:right"/>
            </span>
          </Meta>
        </AListItem>
      </AList>
    )
  }
}
</script>

<style scoped>

</style>
