# tasks_check

# Disclaimer

This project scripts are NOT delivered and/or released by Red Hat. This is an independent project to help customers and Red Hat Support team to analyze some data, help with the troubleshooting, or implement something that is not available in the official way at the moment this one was created.

---

This script will help you to check some files created by the `task export` process from Foreman / Red Hat Satellite


You can call it, but it will stop if you don't pass the path to the `task export` folder
```
$ ./tasks_check.sh
No parameter!
call ./tasks_check.sh <path_to_the_task_files>
exiting ...
```

Whenever you pass the correct folder, with the `index.html` and all the other files, the output should be similar to below
```
$ ./tasks_check.sh task-export/
Folder: task-export/
#######
1. List all the tasks
2. Check a single type of task
3. Check a single type of task (detailed)


0. Exit
#######

Type your selection:
```

From here, you can

List all the tasks, and you will be able to see all the tasks that are in this export
```
Type your selection: 1
option 1
  Actions::BulkAction
  Actions::CheckLongRunningTasks
  Actions::Katello::ActivationKey::Create
  Actions::Katello::ActivationKey::Destroy
  Actions::Katello::ActivationKey::Update
  Actions::Katello::Applicability::Hosts::BulkGenerate
  Actions::Katello::CapsuleContent::Sync
  Actions::Katello::CapsuleContent::UpdateContentCounts
  Actions::Katello::ContentView::CapsuleSync
  Actions::Katello::ContentView::Promote
  Actions::Katello::ContentView::Publish
  Actions::Katello::ContentView::Remove
  Actions::Katello::ContentView::Update
  Actions::Katello::Host::Hypervisors
  Actions::Katello::Organization::ManifestRefresh
  Actions::Katello::OrphanCleanup::RemoveOrphans
  Actions::Katello::Repository::CapsuleSync
  Actions::Katello::RepositorySet::ScanCdn
  Actions::Katello::Repository::Sync
  Actions::Katello::SyncPlan::Run
  Actions::Pulp3::CapsuleContent::ReclaimSpace
  CreateExpiredManifestNotifications
  CreateHostLifecycleExpireSoonNotifications
  CreateManifestExpireSoonWarningNotifications
  CreatePulpDiskSpaceNotifications
  CreateRssNotifications
  ForemanInventoryUpload::Async::GenerateAllReportsJob
  InsightsCloud::Async::InsightsClientStatusAging
  InsightsCloud::Async::InsightsScheduledSync
  InventorySync::Async::InventoryScheduledSync
  SendExpireSoonNotifications
  StoredValuesCleanupJob
```

If you would like to see some additional information, you can just copy one of the tasks above, and pick the option 2 or 3

```
Type your selection: 2
option 2
Please, copy/paste the task you would like to analyze: Actions::Katello::SyncPlan::Run
Ordered by Date
id,label,started_at,ended_at,status,result,smart_proxy
9a923390-796d-419a-9be2-3343ec3237a1,Actions::Katello::SyncPlan::Run,2025-03-03 22:22:03 UTC,2025-03-03 22:22:20 UTC,stopped,success,
6de12cba-6fca-4b3c-bbbd-eff1e6f42483,Actions::Katello::SyncPlan::Run,2025-03-02 22:22:03 UTC,2025-03-02 22:22:20 UTC,stopped,success,
3e9f5641-ad31-481f-8918-1d59ecddf3a6,Actions::Katello::SyncPlan::Run,2025-03-02 06:01:07 UTC,2025-03-02 07:42:32 UTC,stopped,success,
ae681f96-8691-4a29-bd20-c3edc5c2a5cb,Actions::Katello::SyncPlan::Run,2025-03-01 22:22:05 UTC,2025-03-01 22:22:22 UTC,stopped,success,
202919bd-fb53-4c89-a8dd-77a3ef244772,Actions::Katello::SyncPlan::Run,2025-03-01 08:21:06 UTC,2025-03-01 09:40:21 UTC,stopped,success,
a863b1b6-5cac-4e37-ad68-52a743e4b04e,Actions::Katello::SyncPlan::Run,2025-02-28 22:22:06 UTC,2025-02-28 22:22:22 UTC,stopped,success,
15e3c31e-ef37-4c3a-8f45-c93af59a9ce4,Actions::Katello::SyncPlan::Run,2025-02-27 22:22:08 UTC,2025-02-27 22:22:24 UTC,stopped,success,
06a4298b-04f8-4126-a252-855969b53d94,Actions::Katello::SyncPlan::Run,2025-02-26 22:22:09 UTC,2025-02-26 22:22:26 UTC,stopped,success,
64b42e85-7d06-426a-9793-9af2b1010e60,Actions::Katello::SyncPlan::Run,2025-02-25 22:22:10 UTC,2025-02-25 22:22:27 UTC,stopped,success,
1706da2d-758f-48e4-80d7-447c3be49650,Actions::Katello::SyncPlan::Run,2025-01-26 06:01:09 UTC,2025-01-26 07:09:28 UTC,stopped,warning,
```

Above, we can see the information ordered by `started_at`.

If you would like to see some additional info, you can pick the option 3

```
Type your selection: 3
option 3
Please, copy/paste the task you would like to analyze: Actions::Katello::SyncPlan::Run
Ordered by Date
id,label,started_at,ended_at,status,result,smart_proxy
9a923390-796d-419a-9be2-3343ec3237a1,Actions::Katello::SyncPlan::Run,2025-03-03 22:22:03 UTC,2025-03-03 22:22:20 UTC,stopped,success,
===== SNIPPET ERROR TRACE =====
===== END SNIPPET ERROR TRACE =====

6de12cba-6fca-4b3c-bbbd-eff1e6f42483,Actions::Katello::SyncPlan::Run,2025-03-02 22:22:03 UTC,2025-03-02 22:22:20 UTC,stopped,success,
===== SNIPPET ERROR TRACE =====
===== END SNIPPET ERROR TRACE =====

3e9f5641-ad31-481f-8918-1d59ecddf3a6,Actions::Katello::SyncPlan::Run,2025-03-02 06:01:07 UTC,2025-03-02 07:42:32 UTC,stopped,success,
===== SNIPPET ERROR TRACE =====
===== END SNIPPET ERROR TRACE =====

ae681f96-8691-4a29-bd20-c3edc5c2a5cb,Actions::Katello::SyncPlan::Run,2025-03-01 22:22:05 UTC,2025-03-01 22:22:22 UTC,stopped,success,
===== SNIPPET ERROR TRACE =====
===== END SNIPPET ERROR TRACE =====

202919bd-fb53-4c89-a8dd-77a3ef244772,Actions::Katello::SyncPlan::Run,2025-03-01 08:21:06 UTC,2025-03-01 09:40:21 UTC,stopped,success,
===== SNIPPET ERROR TRACE =====
===== END SNIPPET ERROR TRACE =====

a863b1b6-5cac-4e37-ad68-52a743e4b04e,Actions::Katello::SyncPlan::Run,2025-02-28 22:22:06 UTC,2025-02-28 22:22:22 UTC,stopped,success,
===== SNIPPET ERROR TRACE =====
===== END SNIPPET ERROR TRACE =====

15e3c31e-ef37-4c3a-8f45-c93af59a9ce4,Actions::Katello::SyncPlan::Run,2025-02-27 22:22:08 UTC,2025-02-27 22:22:24 UTC,stopped,success,
===== SNIPPET ERROR TRACE =====
===== END SNIPPET ERROR TRACE =====

06a4298b-04f8-4126-a252-855969b53d94,Actions::Katello::SyncPlan::Run,2025-02-26 22:22:09 UTC,2025-02-26 22:22:26 UTC,stopped,success,
===== SNIPPET ERROR TRACE =====
===== END SNIPPET ERROR TRACE =====

64b42e85-7d06-426a-9793-9af2b1010e60,Actions::Katello::SyncPlan::Run,2025-02-25 22:22:10 UTC,2025-02-25 22:22:27 UTC,stopped,success,
===== SNIPPET ERROR TRACE =====
===== END SNIPPET ERROR TRACE =====

1706da2d-758f-48e4-80d7-447c3be49650,Actions::Katello::SyncPlan::Run,2025-01-26 06:01:09 UTC,2025-01-26 07:09:28 UTC,stopped,warning,
===== SNIPPET ERROR TRACE =====
      <b>Error:</b>
    </p>
    <p>
      RuntimeError
    </p>
    <p>
      A sub task failed
    </p>
    <p>
                  <pre class="prettyprint lang-yaml">---
- "/usr/share/gems/gems/dynflow-1.6.4/lib/dynflow/action/with_sub_plans.rb:231:in
  `check_for_errors!'"
- "/usr/share/gems/gems/dynflow-1.6.4/lib/dynflow/action/with_sub_plans.rb:137:in
  `try_to_finish'"
- "/usr/share/gems/gems/dynflow-1.6.4/lib/dynflow/action/with_sub_plans.rb:22:in `block
  in run'"
- "/usr/share/gems/gems/algebrick-0.7.3/lib/algebrick/matchers/abstract.rb:74:in `block
  in assigns'"
- "/usr/share/gems/gems/algebrick-0.7.3/lib/algebrick/matchers/abstract.rb:73:in `tap'"
===== END SNIPPET ERROR TRACE =====
```


This is a simple way to parse the `html` files quickly.

Please, feel free to share ideas/feedback via Issues.

Thank you!

Waldirio