# jenkins-gitflow
Jenkins deployment gitflow branching strategy

# 🚀 GitFlow CI/CD Setup with Jenkins

## 📌 Overview
This project demonstrates an end-to-end GitFlow-based branching strategy integrated with Jenkins CI/CD pipelines across multiple environments.

- GitFlow branching strategy implementation  
- 3 environments: Dev, Test, Prod  
- Jenkins pipelines for build, test & deployment  
- Webhook integration for CI  

---

## 🏗️ Architecture
- Version Control: Git  
- CI/CD Tool: Jenkins  
- Artifact: WAR file  
- Environments: Dev, Test, Prod  

---

## 🌿 Branching Strategy

| Branch Name          | Purpose                   |
|---------------------|---------------------------|
| main                | Production-ready code     |
| dev                 | Integration branch        |
| feature/ui-change   | Feature development       |
| release/v1.1        | Testing (pre-production)  |
| hotfix/* (planned)  | Production bug fixes      |

---

## 🔄 CI/CD Pipeline Flow

### Common Stages
- Checkout code  
- Build application  
- Run unit tests  
- Generate artifact (WAR)  
- Deploy  

---

## ⚙️ Environment-Specific Behavior

### Dev
- Auto-triggered via webhook  
- Skips artifact stage (faster builds)  

### Test
- Full pipeline execution  
- Used for validation  

### Prod
- Manual approval required  
- Controlled deployment  

---

## 🔧 Jenkins Pipeline Features
- Separate pipelines for Dev, Test, and Prod  
- Manual approval step for production  
- Webhook integration for Dev  
- Environment-specific configurations  

---

## 🔥 Upcoming Improvement
- Implement hotfix workflow:
- Create hotfix/* from main  
- Test in HotfixTest environment  
- Merge back to main  

---

## 🎯 Key Learnings
- Practical GitFlow implementation  
- CI/CD pipeline structuring  
- Multi-environment deployment handling  
- Importance of approval gates  

---

## 📬 Feedback
Feel free to explore the repo and share your suggestions!
