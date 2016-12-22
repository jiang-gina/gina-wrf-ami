ENV['HOME'] = '/home/ubuntu'

directory '/home/ubuntu/downloads' do
   end

directory '/home/ubuntu/apps' do
   end

bash 'download ncl-6.3.0' do
   code <<-EOH
     cd $HOME
     mkdir -p apps/ncl_ncarg-6.3.0 
     cd $HOME/downloads
     wget https://www.earthsystemgrid.org/download/fileDownload.html?logicalFileId=8201fa1a-cd9b-11e4-bb80-00c0f03d5b7c
     mv https://www.earthsystemgrid.org/download/fileDownload.html?logicalFileId=8201fa1a-cd9b-11e4-bb80-00c0f03d5b7c ncl_ncarg-6.3.0.Linux_Debian6.0_x86_64_nodap_gcc445.tar.gz
     tar zxvf ncl_ncarg-6.3.0.Linux_Debian6.0_x86_64_nodap_gcc445.tar.gz -C ../apps/ncl_ncarg-6.3.0
     echo "export NCARG_ROOT=/home/ubuntu/apps/ncl_ncarg-6.3.0">>$HOME/.bashrc
     echo 'export PATH=$NCARG_ROOT:$PATH'>>$HOME/.bashrc
     EOH
   end


