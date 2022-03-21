1- Scaffold project
```shell
mkdir exposedapp
cd exposedapp
operator-sdk init --plugins quarkus --domain halkyon.io --project-name expose
```
```shell
~/demos/exposedapp$ tree
.
├── Makefile
├── pom.xml
├── PROJECT
└── src
    └── main
        ├── java
        └── resources
            └── application.properties

4 directories, 4 files

```

1.2- Show log:
```
No Reconciler implementation was found so the Operator was not started.
```

2- Defining a Custom Resource Definition and a controller: in terms of java this is creating a java class extending `CustomResource<ExposedAppSpec, ExposedAppStatus>` and a Reconciler class parametrized with the CR.

```shell
operator-sdk create api --version v1alpha1 --kind ExposedApp
```

```shell

tree
.
├── expose.iml
├── Makefile
├── pom.xml
├── PROJECT
├── src
│   └── main
│       ├── java
│       │   └── io
│       │       └── halkyon
│       │           ├── ExposedApp.java
│       │           ├── ExposedAppReconciler.java
│       │           ├── ExposedAppSpec.java
│       │           └── ExposedAppStatus.java
│       └── resources
│           └── application.properties

```
2.1- Show log:
```
2022-03-17 15:21:57,920 INFO  [io.qua.ope.dep.OperatorSDKProcessor] (build-12) Registered 'io.halkyon.ExposedApp' for reflection
2022-03-17 15:21:57,921 INFO  [io.qua.ope.dep.OperatorSDKProcessor] (build-12) Registered 'io.halkyon.ExposedAppSpec' for reflection
2022-03-17 15:21:57,921 INFO  [io.qua.ope.dep.OperatorSDKProcessor] (build-12) Registered 'io.halkyon.ExposedAppStatus' for reflection
2022-03-17 15:21:57,983 INFO  [io.qua.ope.dep.OperatorSDKProcessor] (build-12) Processed 'io.halkyon.ExposedAppReconciler' reconciler named 'exposedappreconciler' for 'exposedapps.halkyon.io' resource (version 'halkyon.io/v1alpha1')
```

3 - Set to true to automatically apply CRDs to the cluster when they get regenerated
```properties
quarkus.operator-sdk.crd.apply=true
```

3.1- Show log
```shell

2022-03-17 15:44:51,899 INFO  [io.qua.ope.run.OperatorProducer] (Quarkus Main Thread) Applied v1 CRD named 'exposedapps.halkyon.io' from /home/amunozhe/demos/exposedapp/target/kubernetes/exposedapps.halkyon.io-v1.yml
```

4- Look at the code

L
