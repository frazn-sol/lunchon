class ApplicationSerializer < ActiveModel::Serializer
  def initialize(object, options = {})
    options.merge!(root: false)
    super
  end
end
