ENV['HOME'] ='/home/ubuntu'
ENV['WPS_GEOG_MAIN'] = '/data'

bash 'download geog' do
   code <<-EOH
     cd $WPS_GEOG_MAIN
     #wget http://www2.mmm.ucar.edu/wrf/src/wps_files/geog_complete.tar.bz2
     bzip2 -dk geog_complete.tar.bz2
     tar   xvf geog_complete.tar
     EOH
   end
