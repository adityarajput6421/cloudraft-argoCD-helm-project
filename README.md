Documentation: Metrics App with ArgoCD, Helm, and KIND

🔢 Objective

Deploy a containerized app exposing /counter using Helm, ArgoCD, and KIND. Investigate the app's behavior and ensure consistent operation.

metrics-app-sre/
├── Charts/
│   └── metrics-app/                   # Helm chart
├── argocd/
│   ├── application.yaml               # ArgoCD Application manifest
├── bootstrap
|    |__kind-and-argocd-bootstrap.sh   # Shell script to bootstrap KIND & ArgoCD
├── README.md                          # Overview and documentation
└── screenshots                        # Logs and screenshots
|__Kind
    |__kind.yaml                       # Kind cluster yaml


🌐 Deployment Steps:-

*  Prequisites:- Kind and Kubectl should be install. 

1. 📃 Create KIND Cluster And ArgoCD:-
       
       I have created bootstrap script that will create kind cluster and install argoCD.
       
       Kind-cluster.yaml added in the Repo Before executing bootstrap script please make sure it is available in right path 

2.  Installtion Of helm :-
    
    * curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
    * helm version

3. Created Helm Chart:-
    
    * helm create metrics-app
    * created chart.yaml , values.yaml and all templates added in repo.
    * create secret in cluster using kubectl secret.

4. Tested locally:-

    * helm install metrics-app ./metrics-app

5. Push all manifest Github repo

6. Install Ingress:-
    
    * kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/kind/deploy.yaml
    

7. Created argoCD application manifest and applied
  
    * kubectl apply -f application.yaml  
    * Note You need to give your repo inplace of my repo like  "https://github.com/adityarajput6421/cloudraft-argoCD-helm-project.git "

8.  add 127.0.0.1   metrics.local to /etc/hosts file 

9. curl curl http://metrics.local/counter


ArgoCD Dashboard:-

  ![ArgoCD Dashboard](/Screenshots/argoCD-Dashboard.png)

My Cluster Info:- 
  ![alt text](/Screenshots/Cluster-info.png)

-----------------------------------------------------------------------------------

Issue: Website Response Time is Inconsistent
Description:
I observed that the website's response time is fluctuating significantly. The response time is not consistent — sometimes it is very fast, and other times it is noticeably slow. The variation appears to be random and not tied to any specific load condition.

Tools Used for Testing:
I used the following tools to verify this behavior:
1) For loop around url
2) httping
3) wrk

Both tools reported inconsistent response times across multiple requests.

Evidence:
Please find a screenshot showing the varying response times:

1) For Loop around URL:-

   ![For Loop around Url](/Screenshots/loop1.png)
   ![For Loop around Url](/Screenshots/loop2.png)
   ![For Loop around Url](/Screenshots/loop3.png)

2) Httping:-

    ![Httping](/Screenshots/httping.png)

3) WRK:-

    ![WRK](/Screenshots/wrk.png)


Thank You.









    
