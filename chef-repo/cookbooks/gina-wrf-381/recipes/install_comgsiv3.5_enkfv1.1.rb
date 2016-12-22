ENV['JASPERLIB'] = '/usr/lib/x86_64-linux-gnu'
ENV['JASPERINC'] = '/usr/include/jasper'
ENV['NETCDF'] = '/usr'
ENV['WRFIO_NCD_LARGE_FILE_SUPPORT'] = '1'
ENV['WRF_EM_CORE'] = '1'
ENV['WRF_DIR']='/home/ubuntu/wrf381/WRFV3'
ENV['LAPACK_PATH']='/usr/lib/lapack'
ENV['HOME'] = '/home/ubuntu'
bash 'set_env_var' do
  
  code <<-EOH

      
     echo "export NETCDF=$NETCDF">>$HOME/.bashrc
     echo "export JASPERLIB=$JASPERLIB">>$HOME/.bashrc
     echo "export JASPERINC=$JASPERINC">>$HOME/.bashrc
     echo "export WRFIO_NCD_LARGE_FILE_SUPPORT=$WRFIO_NCD_LARGE_FILE_SUPPORT">>$HOME/.bashrc
     echo "export WRF_EM_CORE=$WRF_EM_CORE">>$HOME/.bashrc
     echo "export WRF_DIR=$WRF_DIR">>$HOME/.bashrc
     echo "export LAPACK_PATH=$LAPACK_PATH">>$HOME/.bashrc
  EOH
  not_if "grep -q export NETCDF=$NETCDF $HOME/.bashrc"
end 

bash 'create config_chioces.txt' do
   code <<-EOH
     cat>$HOME/wrf381/comGSIv3.5_EnKFv1.1/config_choices.txt<<EOF
     5
     EOF
   EOH
end 


bash 'compile-comgsiv3.5-enkfv1.1' do

  code <<-EOH
    source $HOME/.bashrc
    cd $HOME/wrf381/comGSIv3.5_EnKFv1.1
    ./clean -a
    ./configure<config_choices.txt
    #replace CPP_FLAGS
    sed -i 's|CPP_FLAGS      =  -C -P|CPP_FLAGS      =  -P|g' configure.gsi

    #modify bufrlib.prm in ./src/libs/bufr
    #if [ ! -f ./src/libs/bufr/bufrlib.prm.orig ];then cp ./src/libs/bufr/bufrlib.prm ./src/libs/bufr/bufrlib.prm.orig;fi
    #sed -n '/^[\t]/p' ./src/libs/bufr/bufrlib.prm.orig>./src/libs/bufr/bufrlib.prm
    ./compile 2>&1 |tee compile_gsi.log
   EOH
 flags '-x'
end  
