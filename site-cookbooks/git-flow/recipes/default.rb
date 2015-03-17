case node['platform']
  when "ubuntu","debian"
    package "git-flow" do
      action :install
    end
end