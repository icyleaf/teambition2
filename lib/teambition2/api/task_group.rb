module Teambition2
  module API
    module TaskGroup
      def task_group(group_id)
        get("/api/tasklists/#{project_id}")
      end

      def create_task_group(project_id, title, template_id: nil, description: nil)
        post('/api/tasklists', {
          'title' => title,
          '_projectId' => project_id,
          '_templateId' => template_id
        })
      end

      def task_group_search(project_id, name, key: 'title', limit: 1)
        result = get("/api/projects/#{project_id}/tasklists").select { |p| p[key].include?(name) }
        return nil if result.empty?

        case limit
        when 0
          result
        when 1
          result[0]
        else
          result.size >= limit ? result[0..limit] : result
        end
      end
    end
  end
end
