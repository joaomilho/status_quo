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
            (self.status = '#{status}') and save
          end
        )
      end
    end
  end
end
ActiveRecord::Base.send(:include, StatusQuo) if defined?(ActiveRecord)

# IDEAS
# def self.status_validations &block
#   validate :status_validations
#   define_method(:status_validations) do
#     block.call
#   end
# end
# status_validations do |from, to|
#   # You can cancel anytime!
#   return if to == 'cancelled'
#   case [from, to]
#   when [:started, :checkout]
#     errors.add :status, 'Endereço não especificado' unless address
#     errors.add :status, 'Você precisa comprar ao menos um produto.' if total.to_f <= 0.0
#   when [:checkout, :payment]
#   when [:payment, :finished]
#     errors.add :status, 'Pagamento não especificado' unless payment_method
#     errors.add :status, 'Cartão não especificado' if payment_method == 'Cartão de crédito' and ! card_id
#     errors.add :status, 'Cartão não especificado' if payment_method == 'Compra com 1-click' and ! card_id
#   else
#     errors.add :status, 'Mudança de status inválida'
#   end
# end
