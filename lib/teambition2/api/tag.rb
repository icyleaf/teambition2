module Teambition2
  module API
    module Tag
      def tags(type, id)
        get("/api/#{type}/#{id}/tags")
      end

      def tag(tag_id)
        get("/api/tags/#{tag_id}")
      end

      def create_tag(project_id, tag)
        post('/api/tags', {
          'name' => tag,
          '_projectId' => project_id
          })
      end

      def tag_search(type, id, name, limit: 1)
        result = tags(type, id).select { |p| p['name'].include?(name) }
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
