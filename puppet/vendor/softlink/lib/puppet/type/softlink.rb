Puppet::Type.newtype(:softlink) do
  @doc = "Creates a soft link.

    A soft link is a symbolic link that we don't care where it points to as
    long as it exists.

    You can specify a fall back value, to create the symbolic link, if it
    currently does not exist."

  ensurable do
    newvalue(:present) { provider.create  }
    newvalue(:absent)  { provider.destroy }

    defaultto :present
  end

  newparam(:path, :namevar => true) do
    desc "The location of the symbolic link."

    validate do |value|
      unless Puppet::Util.absolute_path?(value)
        fail Puppet::Error, "File paths must be fully qualified, not '#{value}'"
      end
    end

    munge do |value|
      ::File.expand_path(value)
    end
  end

  newparam(:fallback) do
    desc "The link fall back location, if it currently does not exists."
  end

  # Automatically require the parent and the fall back if they are managed by
  # puppet. Its nice knowing that you don't have to worry about that.
  autorequire(:file) do
    requires = []

    path = Pathname.new(self[:path])
    return requires if path.root?

    parents = path.parent.enum_for(:ascend)
    if found = parents.find { |p| catalog.resource(:file, p.to_s) }
      requires << found.to_s
    end

    if found = catalog.resource(:file, self[:fallback])
      requires << found.to_s
    end

    requires
  end
end
