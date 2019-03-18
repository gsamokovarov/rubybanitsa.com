module TimeHelper
  def during
    Date.new(params.fetch(:during) { Date.current.year })
  end
end
