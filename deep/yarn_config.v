Require Export yarn_config_fields.
Require Export env_desc.

Record YarnConfig := mk_yarn_config {
  yarn_app_mapreduce_am_command__opts: yarn_app_mapreduce_am_command__opts.ftype
 ;yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size: yarn_app_mapreduce_am_containerlauncher_threadpool__initial__size.ftype
 ;yarn_app_mapreduce_am_job_task_listener_thread__count: yarn_app_mapreduce_am_job_task_listener_thread__count.ftype
 ;yarn_app_mapreduce_am_resource_cpu__vcores: yarn_app_mapreduce_am_resource_cpu__vcores.ftype
 ;yarn_app_mapreduce_am_resource_mb: yarn_app_mapreduce_am_resource_mb.ftype
 ;yarn_nodemanager_container__manager_thread__count: yarn_nodemanager_container__manager_thread__count.ftype
 ;yarn_nodemanager_localizer_client_thread__count: yarn_nodemanager_localizer_client_thread__count.ftype
 ;yarn_nodemanager_localizer_fetch_thread__count: yarn_nodemanager_localizer_fetch_thread__count.ftype
 ;yarn_nodemanager_recovery_compaction__interval__secs: yarn_nodemanager_recovery_compaction__interval__secs.ftype
 ;yarn_nodemanager_resource_cpu__vcores: yarn_nodemanager_resource_cpu__vcores.ftype
 ;yarn_nodemanager_resource_memory__mb: yarn_nodemanager_resource_memory__mb.ftype
 ;yarn_nodemanager_resource_percentage__physical__cpu__limit: yarn_nodemanager_resource_percentage__physical__cpu__limit.ftype
 ;yarn_nodemanager_vmem__check__enabled: yarn_nodemanager_vmem__check__enabled.ftype
 ;yarn_nodemanager_vmem__pmem__ratio: yarn_nodemanager_vmem__pmem__ratio.ftype
 ;yarn_nodemanager_windows__container_cpu__limit_enabled: yarn_nodemanager_windows__container_cpu__limit_enabled.ftype
 ;yarn_nodemanager_windows__container_memory__limit_enabled: yarn_nodemanager_windows__container_memory__limit_enabled.ftype
 ;yarn_resourcemanager_admin_client_thread__count: yarn_resourcemanager_admin_client_thread__count.ftype
 ;yarn_resourcemanager_amlauncher_thread__count: yarn_resourcemanager_amlauncher_thread__count.ftype
 ;yarn_resourcemanager_client_thread__count: yarn_resourcemanager_client_thread__count.ftype
 ;yarn_resourcemanager_ha_enabled: yarn_resourcemanager_ha_enabled.ftype
 ;yarn_resourcemanager_resource__tracker_client_thread__count: yarn_resourcemanager_resource__tracker_client_thread__count.ftype
 ;yarn_resourcemanager_scheduler_class: yarn_resourcemanager_scheduler_class.ftype
 ;yarn_resourcemanager_scheduler_client_thread__count: yarn_resourcemanager_scheduler_client_thread__count.ftype
 ;yarn_resourcemanager_store_class: yarn_resourcemanager_store_class.ftype
 ;yarn_scheduler_increment__allocation__mb: yarn_scheduler_increment__allocation__mb.ftype
 ;yarn_scheduler_maximum__allocation__mb: yarn_scheduler_maximum__allocation__mb.ftype
 ;yarn_scheduler_maximum__allocation__vcores: yarn_scheduler_maximum__allocation__vcores.ftype
 ;yarn_scheduler_minimum__allocation__mb: yarn_scheduler_minimum__allocation__mb.ftype
 ;yarn_scheduler_minimum__allocation__vcores: yarn_scheduler_minimum__allocation__vcores.ftype
 ;yarn_sharedcache_admin_thread__count: yarn_sharedcache_admin_thread__count.ftype
 ;yarn_sharedcache_client__server_thread__count: yarn_sharedcache_client__server_thread__count.ftype
 ;yarn_sharedcache_enabled: yarn_sharedcache_enabled.ftype

 (*constraints here*)
 ;incr_mem_lt_allowed: yarn_scheduler_increment__allocation__mb.value yarn_scheduler_increment__allocation__mb < yarn_scheduler_maximum__allocation__mb.value yarn_scheduler_maximum__allocation__mb
 ;min_allocation_core_lt_max_allocation_core: yarn_scheduler_minimum__allocation__vcores.value yarn_scheduler_minimum__allocation__vcores < yarn_scheduler_maximum__allocation__vcores.value yarn_scheduler_maximum__allocation__vcores
 ;min_allocation_mem_lt_max_allocation_mem: yarn_scheduler_minimum__allocation__mb.value yarn_scheduler_minimum__allocation__mb < yarn_scheduler_maximum__allocation__mb.value yarn_scheduler_maximum__allocation__mb
}.
