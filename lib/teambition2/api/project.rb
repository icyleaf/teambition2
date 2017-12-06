module Teambition2
  module API
    module Project
      def projects
        get('/api/projects')
      end

      def project(project_id)
        get("/api/projects/#{project_id}")
      end

      def project_task_groups(project_id)
        get("/api/projects/#{project_id}/tasklists")
      end

      def project_tags(project_id)
        get("/api/projects/#{project_id}/tags")
      end

      def project_search(name, key: 'name', limit: 1)
        result = projects.select { |p| p[key].include?(name) }
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
