package 'tar' do
  action :install
end

package 'libnetcdf-dev' do
  action :install
end

package 'mpich2' do
  action :install
end

package 'libjasper-dev' do
  action :install
end

package 'libpng12-dev' do
 action :install
end

package 'm4' do
 action :install
end

package 'make' do
 action :install
end

package 'csh' do
 action :install
end

package 'libblas-dev' do
  action :install
end

package 'liblapack-dev' do
 action :install
end


bash 'link libblas.so to /usr/lib/lapack' do

  code <<-EOH
    cd /usr/lib/lapack
    sudo ln -sf ../libblas/libblas.so libblas.so
   EOH
end
package 'bzip2' do 
  action :install
end

package 'netcdf-bin' do

action :install
end

bash 'set NCL_ROOT env' do

  code <<-EOH
    echo "export NCARG_ROOT=/usr/share" >>~/.bashrc
    EOH
end
package ['ncl-ncarg','ksh','imagemagick','bashdb']
