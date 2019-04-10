### DB（数据库）

+ 在mysql中新建`mall_db`数据库，导入`mall_db.sql`文件；
+ 在本地或者服务器安装`Redis`（可不安装，校验短信验证码才需要）

### mall-admin（后台接口）

+ 启动项目：直接运行`com.macro.mall.MallAdminApplication`的`main`方法即可
+ 接口文档地址：http://localhost:10002/swagger-ui.html

### mall-portal（前端接口）

+ 启动项目：直接运行`com.macro.mall.portal.MallPortalApplication`的`main`方法即可
+ 接口文档地址：http://localhost:10001/swagger-ui.html

### OSS（文件上传）

+ 该项目文件上传采用OSS，需要自行注册OSS账号并配置

+ 首先将`mall-admin\src\main\resources\application.properties`文件中以`aliyun.oss.`开头的配置改为你自己的配置
+ OSS上传文件需要配置跨域资源共享(CORS)规则，参考文档：https://help.aliyun.com/document_detail/31928.html
+ 上传方式采用服务端签名后直传的形式，参考文档：https://help.aliyun.com/document_detail/31926.html


### 备注

***其他东西均不需要改动，需要拿前端代码请联系作者***


