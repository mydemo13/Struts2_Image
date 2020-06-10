node {
    def app

    stage('cloneRepository') {
        checkout scm
    }

    stage('buildImage') {
        app = docker.build("mydemo13/struts2_demo:${env.struts2_version}_build", "--build-arg owner_email=${env.owner_email} --build-arg struts2_version=${env.struts2_version} --build-arg tomcat_version=${env.tomcat_version} .")
        echo app.id
    }
    
    stage('twistlockScan') {
        prismaCloudScanImage ca: '', cert: '', dockerAddress: 'unix:///var/run/docker.sock', image: "mydemo13/struts2_demo:${env.struts2_version}_build", key: '', logLevel: 'debug', podmanPath: '', project: '', resultsFile: 'prisma-cloud-scan-results.json', ignoreImageBuildTime: true
    }
    
    stage('twistlockPublish') {
        prismaCloudPublish resultsFilePattern: 'prisma-cloud-scan-results.json'
    }
    
    stage('pushImage') {
        try {
            docker.withRegistry('', 'github_creds') {
                app.push("${env.BUILD_NUMBER}")
                app.push("${env.struts2_version}")
            }
        }catch(error) {
            echo "1st push failed, retrying"
            retry(5) {
                docker.withRegistry('https://docker.io', 'github_creds') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("${env.struts2_version}")
                }
            }
        }
    }
}
