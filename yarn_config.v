Require Import String.
Require Export Coq.ZArith.BinInt.
Require Export Top.util.

(*Configuration for YARN sub-component*)
Record YarnConfig := mk_yarn_config {
   yarn_app_mapreduce_am_command__opts: JavaOpts
  ;yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size: Z
  ;yarn_app_mapreduce_am_job_task_listener_thread__count: Z
  ;yarn_app_mapreduce_am_resource_cpu__vcores: Z
  ;yarn_app_mapreduce_am_resource_mb: Z
  ;yarn_nodemanager_container__manager_thread__count: Z
  ;yarn_nodemanager_localizer_client_thread__count: Z
  ;yarn_nodemanager_localizer_fetch_thread__count: Z
  ;yarn_nodemanager_resource_cpu__vcores: Z
  ;yarn_nodemanager_resource_memory__mb: Z
  ;yarn_nodemanager_resource_percentage__physical__cpu__limit: Z (*100 means 100%*)
  ;yarn_nodemanager_vmem__check__enabled: bool
  ;yarn_nodemanager_windows__container_cpu__limit_enabled: bool
  ;yarn_nodemanager_windows__container_memory__limit_enabled: bool
  ;yarn_resourcemanager_admin_client_thread__count: Z 
  ;yarn_resourcemanager_amlauncher_thread__count: Z
  ;yarn_resourcemanager_client_thread__count: Z
  ;yarn_resourcemanager_resource__tracker_client_thread__count: Z
  ;yarn_resourcemanager_scheduler_class: string
  ;yarn_resourcemanager_scheduler_client_thread__count: Z
  ;yarn_resourcemanager_store_class: string
  ;yarn_scheduler_increment__allocation__mb: Z
  ;yarn_scheduler_maximum__allocation__mb: Z
  ;yarn_scheduler_maximum__allocation__vcores: Z
  ;yarn_scheduler_minimum__allocation__mb: Z
  ;yarn_scheduler_minimum__allocation__vcores: Z
  ;yarn_sharedcache_enabled: bool
  ;yarn_sharedcache_admin_thread__count: if (yarn_sharedcache_enabled) then Z else True
  ;yarn_sharedcache_client__server_thread__count: if (yarn_sharedcache_enabled) then Z else True
}.
