# Building a Jenkins Continuous Integration Environment for CartForge


## Project Overview

This project demonstrates the implementation of a Jenkins Continuous Integration environment for the CartForge application.
The project was developed as part of the ITVedant DevOps–Jenkins Fundamentals Mini Project.
The implementation covers Jenkins installation, GitHub integration, Freestyle jobs, distributed Jenkins Agents (Master & Slave configuration), Pipeline automation, GitHub Webhooks, Automated testing, Application packaging, and Artifact delivery.

---

## Project Objectives

The main objectives of this project are:
- Install and configure Jenkins on Ubuntu Linux.
- Integrate Jenkins with GitHub.
- Create and execute Jenkins Freestyle jobs.
- Configure a distributed Jenkins Agent.
- Develop a Jenkins Pipeline using Jenkinsfile.
- Implement automated CI using GitHub Webhooks.
- Run automated application tests.
- Package application artifacts.
- Monitor Jenkins pipeline execution.
- Document the complete implementation.

---

## Jenkins Architecture

                 GitHub Repository
                        |
                        | Git Push
                        v
                 GitHub Webhook
                        |
                        v
              Jenkins Controller
                        |
                        | Pipeline
                        v
                CartForge-Agent
                        |
          +-------------+-------------+
          |             |             |
        Build          Test        Package
          |             |             |
          +-------------+-------------+
                        |
                        v
                 Jenkins Artifact



##  Installation Steps

[Jenkins Controller]
The Jenkins Controller was installed on an Ubuntu EC2 instance.

Steps included:
Launch Ubuntu EC2.
Install Java, nodejs, npm.
Install Jenkins.
Start Jenkins service.
Enable Jenkins at system startup.
Configure Jenkins through the web interface.
Install suggested plugins.
Create Jenkins administrator account.
Verify Jenkins Dashboard.



##  Jenkins Configuration

Jenkins was configured to connect with the CartForge GitHub repository.
Repository:
https://github.com/shubhamgaonkar0797/Cartforge_Jenkins_P2.git

A Freestyle project named:
CartForge-Freestyle
was created to verify GitHub checkout, dependency installation, testing, and application build.

[Jenkins Agent]
A separate Ubuntu EC2 instance was configured as a Jenkins Agent.

Agent name:
CartForge-Agent
The Agent was connected to the Jenkins Controller using SSH authentication.
The Agent was used to execute the CartForge Pipeline



##  Pipeline Workflow:
The Jenkins Pipeline is defined in:
Jenkinsfile

The pipeline contains the following stages:

Clone Source Code
        |
Install Dependencies
        |
Build Application
        |
Run Tests
        |
Package Application
        |
Deliver Artifact

All stages completed successfully during the final pipeline execution..


[GitHub Webhook]
A GitHub Webhook was configured to automatically trigger Jenkins whenever code was pushed to the repository.
Workflow:

Git Push
   |
GitHub
   |
Webhook
   |
Jenkins
   |
CartForge Pipeline
   |
CartForge-Agent

The webhook was successfully tested and automatically triggered the Jenkins pipeline.

[Application]
The CartForge application is a Node.js application located inside:
app/

Structure:
app/
├── package.json
├── package-lock.json
├── src/
│   └── index.js
├── test/
│   └── test.js
└── dist/

The application uses npm scripts for:
npm install
npm test
npm run build



##  Commands Used:

Check Java     | java --version
Check Git      | git --version
Check Node.js  | node --version
Check npm      | npm --version

Git commands:
git init
git add .
git commit -m "commit message"
git push



##  Folder Structure

Cartforge_Jenkins_P2/
│
├── README.md
├── Jenkinsfile
├── pipeline-report.txt
│
├── app/
│   ├── package.json
│   ├── package-lock.json
│   ├── src/
│   │   └── index.js
│   ├── test/
│   │   └── test.js
│   └── dist/
│
├── scripts/
│   ├── install-jenkins.sh
│   └── backup.sh
│
├── screenshots/
│   ├── jenkins-dashboard.png
│   ├── freestyle-job.png
│   ├── pipeline-stage-view.png
│   ├── agent-online.png
│   └── webhook-trigger.png
│
└── documentation/
    └── Project_Report.pdf



##  Challenges Faced

During implementation, the following challenges were encountered:

Configuring Jenkins on Ubuntu.
Connecting Jenkins with GitHub.
Configuring a separate Jenkins Agent with correct instance type.
Setting up SSH authentication between Controller and Agent.
Ensuring pipeline stages execute on the Agent.
Configuring GitHub Webhooks.
Verifying automatic pipeline execution.
Packaging and archiving application artifacts.
Managing Jenkins backups.

These challenges were resolved through configuration changes, command-line troubleshooting, and Jenkins Console Output analysis.



##  Learning Outcomes

This project provided practical experience with:
AWS Instances server
Jenkins administration
Continuous Integration
Git and GitHub
Jenkins Freestyle projects
Jenkins Pipelines
Jenkinsfile
Distributed Jenkins Agents
SSH authentication
GitHub Webhooks
Automated testing
Artifact management
Jenkins backup
Pipeline monitoring
CI/CD concepts



##  Conclusion

Building a Jenkins Continuous Integration Environment for CartForge was successfully implemented.
The final solution automatically detects GitHub code changes through a Webhook, triggers Jenkins, executes the Pipeline on a dedicated Jenkins Agent, runs tests, builds the application, packages the application, and archives the resulting artifact.
This demonstrates a complete Jenkins-based Continuous Integration workflow.
