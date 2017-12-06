module Teambition2
  module API
    module StageTemplate
      def stage_templates
        get('/api/stagetemplates')
      end

      def stage_template(title, key: 'title', limit: 1)
        result = stage_templates.select { |p| p[key].include?(title) }
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

      def create_stage_template(title, stages)
        post('/api/stagetemplates', { title: title, stages: stages } )
      end
    end
  end
end
