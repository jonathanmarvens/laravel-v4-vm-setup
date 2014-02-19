Vagrant.configure '2' do |configure|
  configure.vm.box      = 'ubuntu-12.04-amd64-server-cloudimg'
  configure.vm.box_url  = 'http://cloud-images.ubuntu.com/vagrant/precise/20140206/precise-server-cloudimg-amd64-vagrant-disk1.box'
  configure.vm.hostname = 'devbox'

  configure.vm.network :private_network, {
    ip: '10.96.48.72',
  }

  configure.vm.provider :virtualbox do |machine|
    machine.customize [
      'modifyvm',
      :id,
      '--accelerate3d',
      'off',
    ]
    machine.customize [
      'modifyvm',
      :id,
      '--cpus',
      '1',
    ]
    machine.customize [
      'modifyvm',
      :id,
      '--memory',
      '768',
    ]
    machine.customize [
      'modifyvm',
      :id,
      '--vtxvpid',
      'off',
    ]
  end

  configure.vm.provision :shell do |shell|
    shell.path        = './vagrant/scripts/prepare.sh'
    shell.privileged  = false
    shell.upload_path = '/tmp/vagrant-prepare.sh'
  end

  configure.vm.provision :shell do |shell|
    shell.path        = './vagrant/scripts/main-setup.fish'
    shell.privileged  = false
    shell.upload_path = '/tmp/vagrant-main-setup.fish'
  end

  configure.vm.provision :host_ruby do |host_ruby|
    host_ruby.clean = lambda do
      require 'fileutils'

      files = []

      files << './dev/application'

      FileUtils.rm_r files, {
        force: true,
        verbose: true,
      }
    end
  end

  configure.vm.synced_folder './dev/application', '/srv/app-dev', {
    create: true,
    type: 'nfs',
  }

  configure.vm.synced_folder './vagrant', '/vagrant', {
    type: 'nfs',
  }
end
