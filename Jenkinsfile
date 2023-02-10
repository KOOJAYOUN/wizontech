
node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
         app = docker.build("kiwini99/powercat")
     }
     stage('Push image') {
         docker.withRegistry('https://registry.hub.docker.com', 'wizontech-github') {
             app.push("$BUILD_NUMBER")
         }
     }
     
}
