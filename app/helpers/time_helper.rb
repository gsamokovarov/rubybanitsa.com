module TimeHelper
  def during
    Time.new(params.fetch(:during) { Time.current.year })
  end
end
