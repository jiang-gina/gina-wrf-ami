ENV['HOME'] = '/home/ubuntu'
bash 'download comgsiv3.5-enkfv1.1' do
   code <<-EOH
     cd $HOME
     mkdir -p downloads
     mkdir -p wrf381
     cd $HOME/downloads
     #wget http://www.dtcenter.org/com-GSI/users.v3.5/downloads/GSI_releases/comGSIv3.5_EnKFv1.1.tar.gz
     tar xvf comGSIv3.5_EnKFv1.1.tar.gz -C ../wrf381 
     #wget http://www.dtcenter.org/com-GSI/users.v3.5/downloads/GSI_releases/CRTM_2.2.3.tar.gz
     tar xvf CRTM_2.2.3.tar.gz -C ../wrf381/comGSIv3.5_EnKFv1.1
     EOH
   end
