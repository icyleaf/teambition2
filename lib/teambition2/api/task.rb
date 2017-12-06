module Teambition2
  module API
    module Task
      def create_task(group_id, content, tag_id: [])
        post('/api/tasks', {
          '_tasklistId' => group_id,
          'content' => content,
          'tagIds' => tag_id,
        })
      end

      def project_tasks(project_id)
        get("/api/projects/#{project_id}")
      end

      def stage_tasks(stage_id)
        get("/api/stages/#{stage_id}/tasks")
      end

      def edit_task_tags(task_id, tags: [])
        put("/api/tasks/#{task_id}/tagIds", 'tagIds[]' => tags)
      end
    end
  end
end
