module TimeHelper
  def during
    Date.new(params.fetch(:during) { Date.current.year }.to_i)
  end
end
