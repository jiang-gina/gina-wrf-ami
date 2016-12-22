ENV['HOME'] ='/home/ubuntu'

bash 'download wps381' do
   code <<-EOH
     cd $HOME
     mkdir -p download
     mkdir -p wrf381
     cd $HOME/downloads
     wget http://www2.mmm.ucar.edu/wrf/src/WPSV3.8.1.TAR.gz
     tar xvf WPSV3.8.1.TAR.gz -C ../wrf381
     EOH
   end
