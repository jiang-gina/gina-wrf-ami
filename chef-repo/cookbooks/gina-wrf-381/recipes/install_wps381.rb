ENV['JASPERLIB'] = '/usr/lib/x86_64-linux-gnu'
ENV['JASPERINC'] = '/usr/include/jasper'
ENV['NETCDF'] = '/usr'
ENV['WRFIO_NCD_LARGE_FILE_SUPPORT'] = '1'
ENV['WRF_EM_CORE'] = '1'
ENV['HOME'] ='/home/ubuntu'

bash 'set_env_var' do
  
  code <<-EOH

      
     echo "export NETCDF=$NETCDF">>$HOME/.bashrc
     echo "export JASPERLIB=$JASPERLIB">>$HOME/.bashrc
     echo "export JASPERINC=$JASPERINC">>$HOME/.bashrc
     echo "export WRFIO_NCD_LARGE_FILE_SUPPORT=$WRFIO_NCD_LARGE_FILE_SUPPORT">>$HOME/.bashrc
     echo "export WRF_EM_CORE=$WRF_EM_CORE">>$HOME/.bashrc
  EOH
  not_if "grep -q export NETCDF=$NETCDF $HOME/.bashrc"
end 



bash 'create config_chioces.txt' do

   code <<-EOH
     cat>$HOME/wrf381/WPS/config_choices.txt<<EOF
     3
     EOF
   EOH
end 


bash 'compile-wps' do

  code <<-EOH
    source $HOME/.bashrc
    cd $HOME/wrf381/WPS
    ./clean -a
    ./configure<config_choices.txt
    ./compile 2>&1 |tee compile.log
   EOH
 flags '-x'
end  
