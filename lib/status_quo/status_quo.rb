
# StatusQuo
# 
# The f*cking simple status management solution
#
# Usage:
#   status :foo, :bar, :baz
#
#   Ok! Now you got:
#   Klass.foo, Klass.bar & Klass.baz
#   inst.foo?, inst.bar? & inst.baz?
#   inst.foo!, inst.bar! & inst.baz!

module StatusQuo
  def self.included(klass)
    klass.extend ClassMethods
  end
  module ClassMethods
    def status *statuses
      for status in statuses
        scope status, where('status = ?', status)
        class_eval %(
          def #{status}?
            self.status == '#{status}'
          end
          def #{status}!
            update_attribute :status, '#{status}'
          end
        )
      end
    end
  end
end
ActiveRecord::Base.send(:include, StatusQuo) if defined?(ActiveRecord)