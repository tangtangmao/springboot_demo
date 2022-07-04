//
pipeline{
//指定任务在那个节点进行
agent any
// 配置全局变量
environment{
harborUser = 'admin'
harborPasswod = 'Harbor12345'
harborurl = '101.42.252.217:8080'
harborRepo = 'repo'
}
// 存放所有任务的合集
stages{
//单个任务
    stage('下载代码'){

        steps{
            checkout([$class: 'GitSCM', branches: [[name: '$tag']], extensions: [], userRemoteConfigs: [[credentialsId: 'aa6e765f-4257-4d90-988d-978b7fbcd1c6', url: 'git@github.com:tangtangmao/springboot_demo.git']]])
            echo'下载代码成功'

        }
    }
    stage('打包部署任务'){
        steps{
            sh '''/root/hxj/apache-maven-3.8.5/bin/mvn clean package -DskipTests'''
            echo'maven编译成功'
        }
    }
    stage('制作成镜像'){
        steps{
            sh '''

            mv ./target/*.jar ./docker/
            pwd
            docker build -t ${JOB_NAME}:$tag ./docker/
            '''
            echo'镜像制作成功'
        }
    }
     stage('上传到harbor服务器'){
            steps{
                sh '''docker login -u ${harborUser} -p ${harborPasswod} ${harborurl}
                docker tag ${JOB_NAME}:$tag ${harborurl}/${harborRepo}/${JOB_NAME}:$tag
                docker push ${harborurl}/${harborRepo}/${JOB_NAME}:$tag'''
                echo'上传私服成功'
            }
        }
     stage('通过publish over ssh 拉取镜像并启动容器  '){
              steps{
                  sshPublisher(publishers: [sshPublisherDesc(configName: 'harbor_ssh', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: "/usr/local/test/docker/deploy.sh $harborurl $harborRepo $JOB_NAME $tag $host_port $container_port", execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'target/*.jar docker/*')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
                  echo'镜像拉取并启动成容器成功'
              }
         }
}
}
