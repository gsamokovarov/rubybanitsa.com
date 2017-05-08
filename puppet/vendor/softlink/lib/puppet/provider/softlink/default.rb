Puppet::Type.type(:softlink).provide :default do
  desc "The default on only provider that creates soft links."

  def create
    FileUtils.ln_s(@resource[:fallback], @resource[:path]) unless exists?
  end

  def destroy
    File.unlink(@resource[:path])
  end

  def exists?
    File.exists?(@resource[:path])
  end
end
