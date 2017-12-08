Require Export yarn_config_fields.
Require Export env_desc.

Record YarnConfig := mk_yarn_config {
  yarn_nodemanager_container__manager_thread__count: yarn_nodemanager_container__manager_thread__count.ftype
 ;yarn_nodemanager_localizer_client_thread__count: yarn_nodemanager_localizer_client_thread__count.ftype
 ;yarn_nodemanager_localizer_fetch_thread__count: yarn_nodemanager_localizer_fetch_thread__count.ftype
 ;yarn_nodemanager_recovery_compaction__interval__secs: yarn_nodemanager_recovery_compaction__interval__secs.ftype
 ;yarn_nodemanager_resource_cpu__vcores: yarn_nodemanager_resource_cpu__vcores.ftype
 ;yarn_nodemanager_resource_memory__mb: yarn_nodemanager_resource_memory__mb.ftype
 ;yarn_nodemanager_resource_percentage__physical__cpu__limit: yarn_nodemanager_resource_percentage__physical__cpu__limit.ftype
 ;yarn_nodemanager_vmem__check__enabled: yarn_nodemanager_vmem__check__enabled.ftype
 ;yarn_resourcemanager_admin_client_thread__count: yarn_resourcemanager_admin_client_thread__count.ftype
 ;yarn_resourcemanager_amlauncher_thread__count: yarn_resourcemanager_amlauncher_thread__count.ftype
 ;yarn_resourcemanager_client_thread__count: yarn_resourcemanager_client_thread__count.ftype
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
 ;incr_mem_lt_allowed: 
   yarn_scheduler_increment__allocation__mb.value yarn_scheduler_increment__allocation__mb < 
     yarn_scheduler_maximum__allocation__mb.value yarn_scheduler_maximum__allocation__mb
 ;min_allocation_core_lt_max_allocation_core: 
    yarn_scheduler_minimum__allocation__vcores.value yarn_scheduler_minimum__allocation__vcores < 
      yarn_scheduler_maximum__allocation__vcores.value yarn_scheduler_maximum__allocation__vcores
 ;min_allocation_mem_lt_max_allocation_mem: 
    yarn_scheduler_minimum__allocation__mb.value yarn_scheduler_minimum__allocation__mb < 
      yarn_scheduler_maximum__allocation__mb.value yarn_scheduler_maximum__allocation__mb
 ;nm_core_lt_env_core: 
    (yarn_nodemanager_resource_cpu__vcores.value yarn_nodemanager_resource_cpu__vcores) < 
      (env_virt_CPU_cores myEnv)
 ;nm_mem_lt_env_mem: 
    (yarn_nodemanager_resource_memory__mb.value yarn_nodemanager_resource_memory__mb) < 
      (env_virt_mem_mb myEnv)
}.
