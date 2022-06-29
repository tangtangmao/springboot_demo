//
pipeline{
//指定任务在那个节点进行
agent any
// 配置全局变量
environment{
key = 'value'
}
// 存放所有任务的合集
stages{
//单个任务
    stage('下载代码'){
        steps{ echo'下载代码成功'
        }
    }
    stage('打包部署任务'){
        steps{ echo'maven编译成功'
        }
    }
    stage('制作成镜像'){
        steps{ echo'镜像制作成功'
        }
    }
     stage('上传到harbor服务器'){
            steps{ echo'上传私服成功'
            }
        }
     stage('从har上拉取所需要的镜像'){
              steps{ echo'镜像拉取成功'
              }
         }
      stage('启动镜像'){
             steps{ echo'容器启动成功！'
             }
         }


}
}