ENV['HOME'] = '/home/ubuntu'

directory "$HOME/downloads" do
   end

bash 'download wrf381' do
   code <<-EOH
     cd $HOME
     mkdir wrf381
     cd $HOME/downloads
     wget http://www2.mmm.ucar.edu/wrf/src/WRFV3.8.1.TAR.gz
     tar xvf WRFV3.8.1.TAR.gz -C ../wrf381
     EOH
   end
