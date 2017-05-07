class banitsa::auth {
  Ssh_authorized_key {
    user    => 'banitsa',
    type    => 'ssh-rsa',
    require => User['banitsa']
  }

  ssh_authorized_key {
    'genadi': key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDr+JLXkVhOKfa1UBTmZBY6YDvtRNFtSaWjvRKicAMyaQkgsPGAEyRwXmduzU5YbBAJ5uLfQw+zWy2f6Mm+1XakkBI53o/KNdkYa0KuDYxXhXL5/oR8s76mSjhtJMvCnMXnjP1azukNNrldHVh+y5vDnXBGckfKvI9aI/ZTo6Lt4IjesoyTQEi8ArDXdt2AAcmz6cl7EipYqFSwepnG0VnkT8ZWOcWF/M1tyHdt18cdzQjbg8VnFJuLmdH+Ly7HfurpraZ89zCsIGygKOKA5OvlI7ThkGx5cRs2+Jm3+wB+cwpsifXQs2896Z4ctDy23SFGghgKz57sZ7w8v06Tb1gB';
  }
}
