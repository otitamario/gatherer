class Project
    attr_accessor :tasks
    def initialize
      @tasks = []
    end
    def incomplete_tasks
      tasks.reject(&:complete?)
    end
    def done?
      incomplete_tasks.empty?
    end
    def total_size
      tasks.sum(&:size)
    end
    def remaining_size
      incomplete_tasks.sum(&:size)
    end

    def completed_velocity
        tasks.sum(&:points_toward_velocity)
      end
      def current_rate
        completed_velocity * 1.0 / 21
      end
      def projected_days_remaining
        remaining_size / current_rate
      end
      def on_schedule?
        (Time.zone.today + projected_days_remaining) <= due_date
      end

  end