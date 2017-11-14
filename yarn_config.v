Require Import String.
Open Scope string_scope.
Require Export util.

(*Configuration for YARN sub-component*)
Record YarnConfig := mk_yarn_config {
   yarn_app_mapreduce_am_command__opts: JavaOpts
  ;yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size: nat
  ;yarn_app_mapreduce_am_job_task_listener_thread__count: nat
  ;yarn_app_mapreduce_am_resource_cpu__vcores: nat
  ;yarn_app_mapreduce_am_resource_mb: nat
  ;yarn_nodemanager_container__manager_thread__count: nat
  ;yarn_nodemanager_localizer_client_thread__count: nat
  ;yarn_nodemanager_localizer_fetch_thread__count: nat
  ;yarn_nodemanager_recovery_compaction__interval__secs: nat
  ;yarn_nodemanager_resource_cpu__vcores: nat
  ;yarn_nodemanager_resource_memory__mb: nat
  ;yarn_nodemanager_resource_percentage__physical__cpu__limit: nat (*100 means 100%*)
  ;yarn_nodemanager_vmem__check__enabled: bool
  ;yarn_nodemanager_windows__container_cpu__limit_enabled: bool
  ;yarn_nodemanager_windows__container_memory__limit_enabled: bool
  ;yarn_resourcemanager_admin_client_thread__count: nat 
  ;yarn_resourcemanager_amlauncher_thread__count: nat
  ;yarn_resourcemanager_client_thread__count: nat
  ;yarn_resourcemanager_resource__tracker_client_thread__count: nat
  ;yarn_resourcemanager_scheduler_class: string
  ;yarn_resourcemanager_scheduler_client_thread__count: nat
  ;yarn_resourcemanager_store_class: string
  ;yarn_scheduler_increment__allocation__mb: nat
  ;yarn_scheduler_maximum__allocation__mb: nat
  ;yarn_scheduler_maximum__allocation__vcores: nat
  ;yarn_scheduler_minimum__allocation__mb: nat
  ;yarn_scheduler_minimum__allocation__vcores: nat
  ;yarn_sharedcache_enabled: bool
  ;yarn_sharedcache_admin_thread__count: if (yarn_sharedcache_enabled) then nat else True
  ;yarn_sharedcache_client__server_thread__count: if (yarn_sharedcache_enabled) then nat else True
}.
